import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../constants/home.constant.dart';

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

  void changeToolIndex(BuildContext context, int index) {
    bottomBarIndex.value = index;

    showModalBottomSheet(
      context: context,
      enableDrag: true,
      isDismissible: true,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TWColors.zinc.shade50,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BottomNavigationBarConstant.sheetItems[index]
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

  final toggleState = false.obs;
}
