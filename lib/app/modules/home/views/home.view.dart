import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import '../controllers/home.controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: <Widget>[
        const Text('HomeView is working').fontSize(20),
        ElevatedButton(
          onPressed: () => Get.toNamed("/__404__"),
          child: const Text("Go"),
        ),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            separator: const SizedBox(height: 16),
          )
          .fractionallySizedBox(widthFactor: 1),
    );
  }
}
