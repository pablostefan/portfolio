import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';

class LoadingSlider extends StatelessWidget {
  const LoadingSlider({
    super.key,
    required this.width,
    required this.height,
    required this.controller,
    this.curve = Curves.fastLinearToSlowEaseIn,
    this.isSlideForward = true,
    this.color = AppColors.black,
  });

  final AnimationController controller;
  final Curve curve;
  final double width;
  final double height;
  final Color color;
  final bool isSlideForward;

  Animation<double> get _animation {
    return Tween<double>(
      begin: isSlideForward ? 0 : width,
      end: isSlideForward ? width : 0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          height: height,
          width: _animation.value,
          color: color,
        );
      },
    );
  }
}
