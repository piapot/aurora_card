import 'package:flutter/material.dart';

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

  static final sheetItems = [
    _toggleSheetItem,
    _backgroundSheetItem,
  ];

  static final _toggleSheetItem = <Widget>[
    const Text("toggle"),
  ];

  static final _backgroundSheetItem = <Widget>[
    const Text("background"),
  ];
}
