import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';

class ErrorViewDesktop extends StatelessWidget {
  const ErrorViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.primaryTwo,
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('404',
              style: TextStyle(
                  color: Colors.white, fontSize: 80, fontWeight: FontWeight.w800, height: 0.95, letterSpacing: 20.0)),
          AppSpacing.gapMicro,
          Text('PAGE NOT FOUND',
              style: TextStyle(color: Colors.white, fontSize: 20, letterSpacing: 20.0, wordSpacing: 10.0))
        ])));
  }
}
