import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdaptiveBuilderWidget extends StatelessWidget {
  final Widget desktop;
  final Widget? tabletNormal;
  final Widget? tabletSmall;

  const AdaptiveBuilderWidget({super.key, required this.desktop, this.tabletNormal, this.tabletSmall});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints: ScreenBreakpoints(
          desktop: RefinedBreakpoints().desktopSmall,
          tablet: RefinedBreakpoints().tabletNormal,
          watch: RefinedBreakpoints().tabletSmall),
      desktop: (context) => desktop,
      tablet: (context) => tabletNormal ?? desktop,
      watch: (context) => tabletSmall ?? (tabletNormal ?? desktop),
      mobile: (context) => tabletSmall ?? (tabletNormal ?? desktop),
    );
  }
}
