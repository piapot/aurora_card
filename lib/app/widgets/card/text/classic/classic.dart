import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:aurora_card/app/widgets/editable_text.dart';

enum DisplayEnum {
  avatar,
  title,
  bio,
  content,
  dateTime,
  supplement,
  link,
  watermark,
}

class ClassicTextCardView extends StatelessWidget {
  const ClassicTextCardView({
    super.key,
    required this.displays,
    required this.avatar,
    required this.title,
    required this.bio,
    required this.content,
    required this.dateTime,
    required this.supplement,
    required this.link,
    required this.watermark,
    required this.colors,
  });

  final List<DisplayEnum> displays;
  final String avatar;
  final String title;
  final String bio;
  final String content;
  final String dateTime;
  final String supplement;
  final String link;
  final String watermark;
  final List<Color> colors;

  Widget _buildWatermark(BuildContext context) {
    return Text(watermark, style: const TextStyle(height: 1))
        .textColor(TWColors.blue.withOpacity(0.8))
        .fontSize(12)
        .center()
        .padding(horizontal: 8, vertical: 4)
        .constrained(height: 24)
        .backgroundColor(TWColors.zinc.shade50.withOpacity(0.8))
        .clipRRect(all: 8);
  }

  Widget _buildHeader(BuildContext context) {
    return <Widget>[
      if (displays.contains(DisplayEnum.avatar))
        const SizedBox(width: 48, height: 48)
            .backgroundColor(TWColors.amber.shade300)
            .clipRRect(all: 9999),
      <Widget>[
        if (displays.contains(DisplayEnum.title))
          MyEditableTextWidget(
              placeholder: 'Please write title...',
              placeholderStyle: TextStyle(
                  fontSize: 18, height: 1.5, color: TWColors.zinc.shade400),
              style: TextStyle(
                  fontSize: 18, height: 1.5, color: TWColors.zinc.shade800),
              textController: TextEditingController(text: title)),
        if (displays.contains(DisplayEnum.bio))
          MyEditableTextWidget(
              placeholder: 'Please write bio...',
              placeholderStyle: TextStyle(
                  fontSize: 14, height: 1.5, color: TWColors.zinc.shade400),
              style: TextStyle(
                  fontSize: 14, height: 1.5, color: TWColors.zinc.shade400),
              textController: TextEditingController(text: bio)),
      ]
          .toColumn(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              separator: const SizedBox(height: 8))
          .flexible(),
    ].toRow(separator: const SizedBox(width: 16));
  }

  Widget _buildContent(BuildContext context) {
    return <Widget>[
      MyEditableTextWidget(
          placeholder: 'Please write content...',
          placeholderStyle: TextStyle(
              fontSize: 20, height: 1.5, color: TWColors.zinc.shade400),
          style: TextStyle(
              fontSize: 20, height: 1.5, color: TWColors.zinc.shade800),
          textController: TextEditingController(text: content)),
    ].toColumn().padding(vertical: 8);
  }

  Widget _buildFooter(BuildContext context) {
    return <Widget>[
      <Widget>[
        if (displays.contains(DisplayEnum.dateTime))
          MyEditableTextWidget(
              placeholder: DateTime.now().toLocal().toString().substring(0, 10),
              placeholderStyle: TextStyle(
                  fontSize: 14, height: 1.5, color: TWColors.zinc.shade400),
              style: TextStyle(
                  fontSize: 14, height: 1.5, color: TWColors.zinc.shade400),
              textController: TextEditingController(text: dateTime)),
        if (displays.contains(DisplayEnum.supplement))
          MyEditableTextWidget(
              placeholder: 'Scan the QR code 👉',
              placeholderStyle: TextStyle(
                  fontSize: 14, height: 1.5, color: TWColors.zinc.shade400),
              style: TextStyle(
                  fontSize: 14, height: 1.5, color: TWColors.zinc.shade400),
              textController: TextEditingController(text: supplement)),
      ]
          .toColumn(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              separator: const SizedBox(height: 8))
          .flexible(),
      if (displays.contains(DisplayEnum.link))
        QrImageView(data: link, padding: EdgeInsets.zero)
            .constrained(width: 48, height: 48),
    ].toRow(
        mainAxisAlignment: MainAxisAlignment.end,
        separator: const SizedBox(width: 8));
  }

  Widget _buildMain(BuildContext context) {
    final canDisplayHeader = [
      DisplayEnum.avatar,
      DisplayEnum.title,
      DisplayEnum.bio
    ].any((e) => displays.contains(e));
    final canDisplayFooter = [
      DisplayEnum.dateTime,
      DisplayEnum.supplement,
      DisplayEnum.link
    ].any((e) => displays.contains(e));

    return <Widget>[
      if (canDisplayHeader) _buildHeader(context),
      _buildContent(context),
      if (canDisplayFooter) _buildFooter(context),
    ]
        .toColumn(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            separator: Divider(
              thickness: 1,
              height: 32,
              color: TWColors.zinc.shade800.withOpacity(0.1),
            ).clipRRect(all: 4))
        .padding(horizontal: 20, vertical: 32)
        .backgroundColor(TWColors.zinc.shade50.withOpacity(0.6))
        .clipRRect(all: 16);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
          TextStyle(fontSize: 18, height: 1.5, color: TWColors.zinc.shade800),
      child: <Widget>[
        _buildMain(context),
        if (displays.contains(DisplayEnum.watermark))
          _buildWatermark(context).positioned(right: 20, top: -12),
      ]
          .toStack(clipBehavior: Clip.none)
          .padding(horizontal: 20, vertical: 80)
          .fractionallySizedBox(widthFactor: 1)
          .backgroundRadialGradient(
            radius: 1,
            tileMode: TileMode.mirror,
            center: Alignment.topLeft,
            colors: switch (colors.length) {
              1 => [colors.first, colors.first],
              int() => colors,
            },
          ),
    );
  }
}
