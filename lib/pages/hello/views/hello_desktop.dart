import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/ui_helpers/app_image.dart';
import 'package:portfolio/ui_helpers/ui_helpers.dart';
import 'package:portfolio/widgets/about_widget/about_desktop.dart';
import 'package:portfolio/widgets/snake_game_widget/snake_game_desktop.dart';

class HelloDesktop extends StatelessWidget {
  final VoidCallback openGithub;

  const HelloDesktop({super.key, required this.openGithub});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
          alignment: Alignment.centerRight,
          child: Image.asset(AppImages.backgroundBlurs.path,
              height: UiHelper.screenHeightPercentage(context, .9),
              width: UiHelper.screenWidthPercentage(context, .55),
              fit: BoxFit.contain)),
      Row(children: [
        AboutDesktop(openGithub: openGithub),
        const SnakeGameDesktop()
      ]),
    ]);
  }
}
