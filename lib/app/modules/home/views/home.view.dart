import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../constants/home.constant.dart';
import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget _buildMain(BuildContext context) {
    return <Widget>[
      const Text("TODO").fontSize(24),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          separator: const SizedBox(height: 16),
        )
        .fractionallySizedBox(widthFactor: 1)
        .backgroundRadialGradient(
            tileMode: TileMode.mirror,
            center: Alignment.topLeft,
            colors: [TWColors.cyan.shade200, TWColors.blue.shade200]);
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: TWColors.zinc.shade800,
        unselectedItemColor: TWColors.zinc.shade800,
        backgroundColor: TWColors.zinc.shade100,
        currentIndex: controller.bottomBarIndex.value,
        onTap: controller.changeToolIndex,
        items: BottomNavigationBarConstant.barItems,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aurora Card')),
      body: _buildMain(context),
      bottomNavigationBar: _buildBottomNavigationBar(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera),
      ),
    );
  }
}
