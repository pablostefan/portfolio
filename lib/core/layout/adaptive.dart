import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

enum DisplayType {
  desktop,
  mobile,
  tablet,
}

const ipadProBreakpoint = 1000.0;

/// Returns a boolean if we are in a display of [DisplayType.mobile]. Used to
/// build adaptive and responsive layouts.
bool isDisplayMobile(BuildContext context) {
  return MediaQuery.of(context).size.width <= RefinedBreakpoints().tabletSmall;
}

/// Returns a boolean if we are in a display of [DisplayType.mobile] or [DisplayType.tablet]. Used to
/// build adaptive and responsive layouts.
bool isDisplayMobileOrTablet(BuildContext context) {
  return MediaQuery.of(context).size.width <= RefinedBreakpoints().tabletNormal;
}








