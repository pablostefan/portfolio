import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_slide_transition.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class MoreProjectWidget extends StatefulWidget {
  const MoreProjectWidget({super.key});

  @override
  State<MoreProjectWidget> createState() => _MoreProjectWidgetState();
}

class _MoreProjectWidgetState extends State<MoreProjectWidget> with TickerProviderStateMixin {
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

    final textButtonStyle = textTheme.headlineSmall?.copyWith(
      color: AppColors.black,
      fontSize: context.responsiveSize(30, 40, md: 36, sm: 32),
      height: 2.0,
    );

    final margin = EdgeInsets.only(
      left: context.responsiveSize(context.assignWidth(0.1), context.assignWidth(0.15), sm: context.assignWidth(0.15)),
    );

    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: context.isDisplayMobileOrTablet,
            child: SizedBox(height: 150),
          ),
          Text(
            StringConst.THERES_MORE.toUpperCase(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: context.responsiveSize(11, Sizes.TEXT_SIZE_12),
                letterSpacing: 2,
                fontWeight: FontWeight.w300),
          ),
          const SpaceH16(),
          MouseRegion(
            onEnter: (_) => _controller.forward(),
            onExit: (_) => _controller.reverse(),
            child: AnimatedSlideTransition(
              controller: _controller,
              beginOffset: const Offset(0, 0),
              targetOffset: const Offset(0.05, 0),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.work),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      StringConst.VIEW_ALL_PROJECTS.toLowerCase(),
                      style: textButtonStyle,
                    ),
                    const SpaceW12(),
                    Image.asset(
                      ImagePath.ARROW_RIGHT,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
