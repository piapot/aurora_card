import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:aurora_card/app/widgets/card/text/classic/classic.dart';

import '../constants/home.constant.dart';
import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        enableFeedback: true,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: TWColors.zinc.shade800,
        unselectedItemColor: TWColors.zinc.shade800,
        backgroundColor: TWColors.zinc.shade100,
        currentIndex: controller.bottomBarIndex.value,
        onTap: (index) => controller.changeToolIndex(context, index),
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
