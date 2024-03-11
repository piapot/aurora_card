import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';

final themeData = ThemeData(
  appBarTheme: AppBarTheme(
    centerTitle: false,
    backgroundColor: TWColors.zinc.shade100,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: TWColors.zinc.shade50,
    backgroundColor: TWColors.zinc.shade800,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9999)),
  ),
  bottomSheetTheme: const BottomSheetThemeData(showDragHandle: true),
);
