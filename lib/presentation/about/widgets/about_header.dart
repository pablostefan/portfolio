import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class AboutHeader extends StatelessWidget {
  final double width;
  final AnimationController controller;

  const AboutHeader({
    super.key,
    required this.width,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilderWidget(
      tabletSmall: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutDescription(controller: controller, width: context.widthOfScreen),
          SpaceH30(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                ImagePath.ABOUT,
                fit: BoxFit.contain,
                width: context.assignWidth(.7),
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutDescription(controller: controller, width: width * 0.55),
          Spacer(),
          FadeTransition(
            opacity: controller,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                ImagePath.ABOUT,
                width: context.assignWidth(.27),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutDescription extends StatelessWidget {
  const AboutDescription({
    super.key,
    required this.controller,
    required this.width,
  });

  final AnimationController controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? style = textTheme.bodyLarge?.copyWith(
      fontSize: context.responsive(26, 34, sm: 28, md: 30, xl: 45),
      height: 1.2,
      fontWeight: FontWeight.w200,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        TextSlideBoxWidget(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_1,
          width: width,
          maxLines: 10,
          textStyle: style,
        ),
        SizedBox(height: context.responsive(20, 40, sm: 20, md: 40, xl: 40)),
        TextSlideBoxWidget(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_2,
          width: width,
          maxLines: 10,
          textStyle: style,
        ),
      ],
    );
  }
}
