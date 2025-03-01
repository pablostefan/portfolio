import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

extension Layout on BuildContext {
  double get widthOfScreen => MediaQuery.sizeOf(this).width;

  double get heightOfScreen => MediaQuery.sizeOf(this).height;

  bool get isMobileOrTablet => widthOfScreen <= RefinedBreakpoints().tabletNormal;

  bool get isMobile => widthOfScreen <= RefinedBreakpoints().tabletSmall;

  double assignHeight(
    double fraction, {
    double additions = 0,
    double subs = 0,
  }) {
    return (heightOfScreen - (subs) + (additions)) * fraction;
  }

  double assignWidth(
    double fraction, {
    double additions = 0,
    double subs = 0,
  }) {
    return (widthOfScreen - (subs) + (additions)) * fraction;
  }

  double responsive(
    double xs,
    double lg, {
    double? sm,
    double? md,
    double? xl,
  }) {
    return layout.value(
      xs: xs,
      sm: sm ?? (md ?? xs),
      md: md ?? lg,
      lg: lg,
      xl: xl ?? lg,
    );
  }
}
