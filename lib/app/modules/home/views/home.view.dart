import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:aurora_card/app/widgets/card/text/classic/classic.dart';

import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  void _showBottomSheet(BuildContext context) {
    final toggleSheetItem = <Widget>[
      const Text("toggle"),
    ];

    final backgroundSheetItem = <Widget>[
      Text("background${controller.bottomBarIndex.value}"),
    ];

    final sheetItem = [
      toggleSheetItem,
      backgroundSheetItem,
    ][controller.bottomBarIndex.value];

    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TWColors.zinc.shade50,
      barrierColor: Colors.transparent,
      builder: (context) {
        return sheetItem
            .toColumn(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            )
            .padding(horizontal: 20, bottom: 48)
            .fractionallySizedBox(widthFactor: 1);
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        enableFeedback: true,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 28,
        selectedLabelStyle: const TextStyle(height: 2),
        selectedItemColor: TWColors.zinc.shade800,
        unselectedItemColor: TWColors.zinc.shade800,
        backgroundColor: TWColors.zinc.shade100,
        currentIndex: controller.bottomBarIndex.value,
        onTap: (index) {
          controller.bottomBarIndex.value = index;
          _showBottomSheet(context);
        },
        items: BottomNavigationBarConstant.barItems,
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return <Widget>[
      ClassicTextCardView(
        displays: DisplayEnum.values,
        avatar: 'Avatar',
        title: '',
        bio: '',
        content: '',
        dateTime: '',
        supplement: '',
        link: 'https://www.example.com',
        watermark: '# AuroraCard App',
        colors: [TWColors.cyan.shade200, TWColors.blue.shade200],
      ),
    ]
        .toColumn(mainAxisSize: MainAxisSize.min)
        .fractionallySizedBox(widthFactor: 1)
        .scrollable()
        .center();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AuroraCard')),
      body: _buildMain(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}
