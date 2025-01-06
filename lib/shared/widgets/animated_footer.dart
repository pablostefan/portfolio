import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_bubble_button.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

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
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );

    TextStyle? titleStyle = textTheme.headlineSmall?.copyWith(
      color: AppColors.accentColor,
      fontSize: context.responsive(
        Sizes.TEXT_SIZE_20,
        Sizes.TEXT_SIZE_50,
        md: Sizes.TEXT_SIZE_40,
      ),
    );

    TextStyle? subtitleStyle = style?.copyWith(
      color: AppColors.grey550,
      fontSize: Sizes.TEXT_SIZE_18,
      fontWeight: FontWeight.w400,
    );

    return Container(
      width: widget.width ?? context.widthOfScreen,
      height: widget.height ??
          context.responsive(context.assignHeight(.8), context.assignHeight(.8), md: context.assignHeight(.5)),
      color: widget.backgroundColor,
      child: VisibilityDetectorWidget(
        key: Key('animated-footer'),
        context: context,
        minVisible: 25,
        action: controller.forward,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            AnimatedPositionedText(
              maxLines: 3,
              width: context.widthOfScreen - 40,
              text: StringConst.WORK_TOGETHER,
              textAlign: TextAlign.center,
              textStyle: titleStyle,
              controller: controller,
            ),
            Spacer(),
            AnimatedPositionedText(
              text: StringConst.AVAILABLE_FOR_FREELANCE,
              textAlign: TextAlign.center,
              textStyle: subtitleStyle,
              maxLines: 3,
              width: context.widthOfScreen - 40,
              controller: controller,
            ),
            SpaceH40(),
            AnimatedBubbleButton(
              title: StringConst.SAY_HELLO.toUpperCase(),
              onTap: () => context.go(Routes.contact),
            ),
            Spacer(flex: 3),
            AdaptiveBuilderWidget(
              tabletNormal: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.PADDING_8),
                child: SimpleFooterSm(),
              ),
              desktop: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.PADDING_8),
                child: SimpleFooterLg(),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
