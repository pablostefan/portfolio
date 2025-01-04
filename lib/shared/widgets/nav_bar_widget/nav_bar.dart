import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptative_builder_widget.dart';
import 'package:portfolio/shared/widgets/nav_bar_widget/desktop_nav_bar_widget.dart';
import 'package:portfolio/shared/widgets/nav_bar_widget/mobile_nav_bar_widget.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.selectedRouteTitle,
    required this.selectedRouteName,
    required this.controller,
    this.selectedRouteTitleStyle,
    this.onMenuTap,
    this.onNavItemWebTap,
    this.hasSideTitle = true,
    this.selectedTitleColor = AppColors.black,
    this.titleColor = AppColors.grey600,
    this.appLogoColor = AppColors.black,
  });

  final String selectedRouteTitle;
  final String selectedRouteName;
  final AnimationController controller;
  final TextStyle? selectedRouteTitleStyle;
  final GestureTapCallback? onMenuTap;
  final bool hasSideTitle;
  final Color titleColor;
  final Color selectedTitleColor;
  final Color appLogoColor;
  final Function(String)? onNavItemWebTap;

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilderWidget(
      desktop: DesktopNavBarWidget(
          onNavItemWebTap: onNavItemWebTap,
          appLogoColor: appLogoColor,
          controller: controller,
          titleColor: titleColor,
          selectedTitleColor: selectedTitleColor,
          selectedRouteName: selectedRouteName,
          hasSideTitle: hasSideTitle,
          selectedRouteTitle: selectedRouteTitle,
          selectedRouteTitleStyle: selectedRouteTitleStyle),
      tabletNormal: MobileNavBarWidget(appLogoColor: appLogoColor, onMenuTap: onMenuTap),
    );
  }
}
