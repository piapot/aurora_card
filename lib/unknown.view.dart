import 'package:flutter/material.dart';

import 'package:flutter_tailwind_colors/flutter_tailwind_colors.dart';
import 'package:styled_widget/styled_widget.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tips")),
      body: const Text("Not Found Page")
          .fontSize(24)
          .textColor(TWColors.zinc.shade800)
          .center(),
    );
  }
}
