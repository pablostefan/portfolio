import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_images.dart';
import 'package:portfolio/ui_helpers/ui_helpers.dart';

class SnakeGameDesktop extends StatelessWidget {
  const SnakeGameDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: UiHelper.getResponsiveHorizontalSpaceSmall(context)),
        width: UiHelper.thirdScreenWidth(context),
        constraints: BoxConstraints(maxHeight: UiHelper.screenHeightPercentage(context, .6)),
        child: Image.asset(AppImages.snakeGame.path, fit: BoxFit.contain));
  }
}
