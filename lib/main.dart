import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:aurora_card/app/routes/app_pages.dart';
import 'package:aurora_card/global.binding.dart';
import 'package:aurora_card/theme.dart';
import 'package:aurora_card/unknown.view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: themeData,
      defaultTransition: Transition.cupertino,
      initialBinding: GlobalBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: GetPage(name: "/404", page: () => const UnknownView()),
    );
  }
}
