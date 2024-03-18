import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class BottomNavigationBarConstant {
  static const toggle = 0;
  static const background = 1;

  static const barItems = [
    BottomNavigationBarItem(
      label: "Toggle",
      icon: Icon(Icons.toggle_on),
    ),
    BottomNavigationBarItem(
      label: "Background",
      icon: Icon(Icons.format_color_fill),
    ),
  ];
}

class HomeController extends GetxController {
  final bottomBarIndex = BottomNavigationBarConstant.toggle.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
