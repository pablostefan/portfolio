import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/presentation/pages/contact_page.dart';
import 'package:portfolio/presentation/pages/widgets/simple_footer.dart';
import 'package:portfolio/presentation/widgets/animated_bubble_button.dart';
import 'package:portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimatedFooter extends StatefulWidget {
  const AnimatedFooter({
    super.key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.black,
  });

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  State<AnimatedFooter> createState() => _AnimatedFooterState();
}

class _AnimatedFooterState extends State<AnimatedFooter> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleImageSize = responsiveSize(context, 100, 150);
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    TextStyle? titleStyle = textTheme.headlineSmall?.copyWith(
      color: AppColors.accentColor,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_30,
        Sizes.TEXT_SIZE_60,
        md: Sizes.TEXT_SIZE_50,
      ),
    );
    TextStyle? subtitleStyle = style?.copyWith(
      color: AppColors.grey550,
      fontSize: Sizes.TEXT_SIZE_18,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: widget.width ?? widthOfScreen(context),
      height: widget.height ?? assignHeight(context, 0.8),
      color: widget.backgroundColor,
      child: VisibilityDetector(
        key: Key('animated-footer'),
        onVisibilityChanged: (visibilityInfo) {
          double visiblePercentage = visibilityInfo.visibleFraction * 100;
          if (visiblePercentage > 25) {
            controller.forward();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            AnimatedPositionedText(
              text: StringConst.WORK_TOGETHER,
              textAlign: TextAlign.center,
              textStyle: titleStyle,
              controller: CurvedAnimation(
                parent: controller,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            Spacer(),
            AnimatedPositionedText(
              text: StringConst.AVAILABLE_FOR_FREELANCE,
              textAlign: TextAlign.center,
              textStyle: subtitleStyle,
              factor: 2.0,
              controller: CurvedAnimation(
                parent: controller,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            SpaceH40(),
            AnimatedBubbleButton(
              title: StringConst.SAY_HELLO.toUpperCase(),
              onTap: () {
                Navigator.pushNamed(context, ContactPage.contactPageRoute);
              },
            ),
            Spacer(flex: 3),
            ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth <= RefinedBreakpoints().tabletNormal) {
                  return Column(
                    children: [
                      SimpleFooterSm(),
                      SpaceH8(),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      SimpleFooterLg(),
                      SpaceH8(),
                    ],
                  );
                }
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
