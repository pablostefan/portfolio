import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptative_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
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
    double imageWidthLg = context.responsiveSize(width * .4, width * .4, md: width * .4);
    return AdaptiveBuilderWidget(
      tabletSmall: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutDescription(controller: controller, width: context.widthOfScreen),
          SpaceH30(),
          FadeTransition(
            opacity: controller,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                ImagePath.DEV,
                fit: BoxFit.cover,
                width: context.widthOfScreen,
                height: context.assignHeight(.45),
              ),
            ),
          ),
        ],
      ),
      desktop: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContentArea(
            width: width * 0.55,
            child: AboutDescription(
              controller: controller,
              width: width * 0.55,
            ),
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
                  fit: BoxFit.cover,
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
      fontSize: context.responsiveSize(26, 40, md: 35),
      height: 1.2,
      fontWeight: FontWeight.w200,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_1,
          width: width,
          maxLines: 2,
          textStyle: style,
        ),
        SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_2,
          width: width,
          maxLines: 10,
          heightFactor: 2,
          textStyle: style,
        ),
        SpaceH4(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_4,
          width: width,
          maxLines: 10,
          textStyle: style,
        ),
        SpaceH8(),
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: StringConst.ABOUT_DEV_CATCH_LINE_5,
          width: width,
          maxLines: 10,
          textStyle: style,
        ),
      ],
    );
  }
}
