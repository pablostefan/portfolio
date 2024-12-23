import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/presentation/widgets/animated_slide_transition.dart';
import 'package:portfolio/values/values.dart';

class SlidingBanner extends StatefulWidget {
  const SlidingBanner({super.key});

  @override
  State<SlidingBanner> createState() => _SlidingBannerState();
}

class _SlidingBannerState extends State<SlidingBanner> with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 8000),
    )..repeat();
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reset();
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: widthOfScreen(context),
      height: assignHeight(context, 0.5),
      color: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedSlideTransition(
            controller: controller,
            position: Tween<Offset>(
              begin: Offset.fromDirection(0, 0),
              end: Offset.fromDirection(1, 5),
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: Curves.ease,
              ),
            ),
            child: Text(
              "TITLE",
              style: textTheme.headlineMedium?.copyWith(
                color: AppColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
