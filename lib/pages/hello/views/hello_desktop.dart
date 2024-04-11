import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/ui_helpers/app_image.dart';
import 'package:portfolio/ui_helpers/ui_helpers.dart';
import 'package:portfolio/widgets/about_widget/about_widget.dart';
import 'package:portfolio/widgets/snake_game_widget/snake_game_widget.dart';

class HelloDesktop extends StatelessWidget {
  final VoidCallback openGithub;

  const HelloDesktop({super.key, required this.openGithub});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.centerRight,
          child: Image.asset(AppImages.backgroundBlurs.path,
              width: UiHelper.screenWidthPercentage(context, .55), fit: BoxFit.cover)),
      Row(children: [AboutWidget(openGithub: openGithub), const SnakeGameWidget()]),
    ]);
  }
}
