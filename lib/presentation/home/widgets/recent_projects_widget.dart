import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

class RecentProjectsWidget extends StatefulWidget {
  const RecentProjectsWidget({super.key});

  @override
  State<RecentProjectsWidget> createState() => _RecentProjectsWidgetState();
}

class _RecentProjectsWidgetState extends State<RecentProjectsWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final margin = EdgeInsets.only(
      left: context.responsive(context.assignWidth(0.1), context.assignWidth(0.15), sm: context.assignWidth(0.15)),
    );

    return VisibilityDetectorWidget(
      key: const Key('recent-projects'),
      context: context,
      minVisible: 40,
      action: _controller.forward,
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextSlideBoxWidget(
              controller: _controller,
              text: StringConst.CRAFTED_WITH_LOVE,
              maxLines: 5,
              width: context.widthOfScreen * .8,
              textStyle: textTheme.headlineSmall?.copyWith(
                color: AppColors.black,
                fontSize: context.responsive(30, 48, md: 40, sm: 36),
              ),
            ),
            const SpaceH16(),
            AnimatedPositionedText(
              controller: _controller,
              text: StringConst.SELECTION,
              maxLines: 5,
              width: context.widthOfScreen * .8,
              textStyle: textTheme.bodyLarge?.copyWith(
                fontSize: context.responsive(Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
