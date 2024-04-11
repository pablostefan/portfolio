import 'dart:math';

import 'package:flutter/material.dart';

class UiHelper {
  static Widget verticalSpace(double height) => SizedBox(height: height);

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static double screenHeightFraction(
    BuildContext context, {
    int dividedBy = 1,
    double offsetBy = 0,
    double max = 3000,
  }) {
    return min((screenHeight(context) - offsetBy) / dividedBy, max);
  }

  static double screenWidthFraction(
    BuildContext context, {
    int dividedBy = 1,
    double offsetBy = 0,
    double max = 3000,
  }) {
    return min((screenWidth(context) - offsetBy) / dividedBy, max);
  }

  static double screenWidthPercentage(BuildContext context, double percentage) {
    return screenWidth(context) * percentage;
  }

  static double halfScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 2);

  static double thirdScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 3);

  static double quarterScreenWidth(BuildContext context) => screenWidthFraction(context, dividedBy: 4);

  static double getResponsiveHorizontalSpaceMedium(BuildContext context) => screenWidthFraction(context, dividedBy: 10);

  static double getResponsiveHorizontalSpaceSmall(BuildContext context) => screenWidthFraction(context, dividedBy: 20);

  static double getResponsiveHorizontalSpaceExtraSmall(BuildContext context) =>
      screenWidthFraction(context, dividedBy: 30);

  static double getResponsiveSmallFontSize(BuildContext context) {
    return getResponsiveFontSize(context, fontSize: 14, max: 15);
  }

  static double getResponsiveMediumFontSize(BuildContext context) {
    return getResponsiveFontSize(context, fontSize: 16, max: 17);
  }

  static double getResponsiveLargeFontSize(BuildContext context) {
    return getResponsiveFontSize(context, fontSize: 21, max: 31);
  }

  static double getResponsiveExtraLargeFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 25);

  static double getResponsiveMassiveFontSize(BuildContext context) => getResponsiveFontSize(context, fontSize: 30);

  static double getResponsiveFontSize(
    BuildContext context, {
    double? fontSize,
    double? max,
  }) {
    max ??= 100;
    var responsiveSize = min(screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100), max);

    return responsiveSize;
  }
}
