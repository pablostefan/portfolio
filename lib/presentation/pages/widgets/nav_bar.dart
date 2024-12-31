import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/app_logo.dart';
import 'package:portfolio/shared/widgets/empty.dart';
import 'package:portfolio/shared/widgets/nav_item.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

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

  /// this handles navigation when on desktops
  final Function(String)? onNavItemWebTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      double screenWidth = sizingInformation.screenSize.width;

      if (screenWidth <= RefinedBreakpoints().tabletNormal) {
        return mobileNavBar(context);
      } else {
        return webNavBar(context);
      }
    });
  }

  Widget mobileNavBar(BuildContext context) {
    return Container(
      width: widthOfScreen(context),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_30,
        vertical: Sizes.PADDING_24,
      ),
      child: Row(
        children: [
          AppLogo(
            fontSize: Sizes.TEXT_SIZE_40,
            titleColor: appLogoColor,
          ),
          Spacer(),
          InkWell(
            onTap: onMenuTap,
            child: Icon(
              FeatherIcons.menu,
              size: Sizes.TEXT_SIZE_30,
              color: appLogoColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget webNavBar(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = selectedRouteTitleStyle ??
        textTheme.bodyLarge?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: Sizes.TEXT_SIZE_12,
        );
    return SizedBox(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(Sizes.RADIUS_20),
                ),
                boxShadow: [BoxShadow(blurRadius: 5, color: AppColors.grey200)]),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: Sizes.PADDING_8),
                  child: AppLogo(titleColor: appLogoColor),
                ),
                Spacer(),
                ..._buildNavItems(context, menuList: Data.menuItems),
                PortfolioButton(
                  height: Sizes.HEIGHT_36,
                  hasIcon: false,
                  width: 95,
                  buttonColor: AppColors.white,
                  borderColor: appLogoColor,
                  onHoverColor: appLogoColor,
                  title: StringConst.RESUME.toUpperCase(),
                  borderRadius: Sizes.RADIUS_8,
                  onPressed: () {
                    Functions.launchUrl(DocumentPath.CV);
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          hasSideTitle
              ? RotatedBox(
                  quarterTurns: 3,
                  child: AnimatedTextSlideBoxTransition(
                    controller: controller,
                    text: selectedRouteTitle.toUpperCase(),
                    textStyle: style,
                  ),
                )
              : Empty(),
          Spacer(),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(
    BuildContext context, {
    required List<NavItemData> menuList,
  }) {
    List<Widget> items = [];
    for (int index = 0; index < menuList.length; index++) {
      items.add(
        NavItem(
          controller: controller,
          title: menuList[index].name,
          route: menuList[index].route,
          titleColor: titleColor,
          selectedColor: selectedTitleColor,
          index: index + 1,
          isSelected: menuList[index].route == selectedRouteName ? true : false,
          onTap: () {
            if (onNavItemWebTap != null) {
              onNavItemWebTap!(menuList[index].route);
            }
          },
        ),
      );
      items.add(SpaceW24());
    }
    return items;
  }
}
