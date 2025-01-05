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
    double imageWidthLg = context.responsive(width * .4, width * .4, md: width * .4);
    return AdaptiveBuilderWidget(
      tabletSmall: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutDescription(controller: controller, width: context.widthOfScreen),
          SpaceH30(),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                ImagePath.DEV,
                fit: BoxFit.contain,
                height: context.assignHeight(.45),
              ),
            ),
          ),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AboutDescription(
            controller: controller,
            width: width * 0.55,
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: imageWidthLg,
                minWidth: imageWidthLg,
                maxHeight: context.assignHeight(.55),
              ),
              child: FadeTransition(
                opacity: controller,
                child: Image.asset(
                  ImagePath.DEV,
                  fit: BoxFit.contain,
                ),
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
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_1,
          width: width,
          maxLines: 10,
          heightFactor: context.responsive(1.6, 1.4, sm: 1.4, md: 1.4, xl: 1.4),
          textStyle: style,
        ),
        SizedBox(height: context.responsive(20, 40, sm: 20, md: 40, xl: 40)),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_2,
          width: width,
          maxLines: 10,
          heightFactor: context.responsive(1.4, 1.4, sm: 1.4, md: 1.4, xl: 1.4),
          textStyle: style,
        ),
      ],
    );
  }
}
