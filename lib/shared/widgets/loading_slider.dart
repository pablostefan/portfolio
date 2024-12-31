import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';

class LoadingSlider extends AnimatedWidget {
  const LoadingSlider({
    super.key,
    required this.width,
    required this.height,
    required this.controller,
    this.curve = Curves.fastLinearToSlowEaseIn,
    this.isSlideForward = true,
    this.color = AppColors.black,
  }) : super(listenable: controller);

  final AnimationController controller;
  final Curve curve;
  final double width;
  final double height;
  final Color color;
  final bool isSlideForward;

  Animation<double> get forwardSlideAnimation => Tween<double>(
        begin: 0,
        end: width,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: curve,
        ),
      );

  Animation<double> get backwardsSlideAnimation => Tween<double>(
        begin: width,
        end: 0,
      ).animate(
        CurvedAnimation(
          parent: controller,
          curve: curve,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: isSlideForward ? forwardSlideAnimation.value : backwardsSlideAnimation.value,
      color: color,
    );
  }
}
