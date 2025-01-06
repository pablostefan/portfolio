import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/app_logo.dart';
import 'package:portfolio/shared/widgets/nav_bar_widget/nav_item.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class DesktopNavBarWidget extends StatelessWidget {
  final Function(String)? onNavItemWebTap;
  final Color appLogoColor;
  final AnimationController controller;
  final Color titleColor;
  final Color selectedTitleColor;
  final String selectedRouteName;
  final bool hasSideTitle;
  final String selectedRouteTitle;
  final TextStyle? selectedRouteTitleStyle;

  const DesktopNavBarWidget({
    super.key,
    this.onNavItemWebTap,
    required this.appLogoColor,
    required this.controller,
    required this.titleColor,
    required this.selectedTitleColor,
    required this.selectedRouteName,
    required this.hasSideTitle,
    required this.selectedRouteTitle,
    this.selectedRouteTitleStyle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? style = selectedRouteTitleStyle ??
        textTheme.bodyLarge?.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.w400,
          fontSize: Sizes.TEXT_SIZE_12,
        );

    return SizedBox(
      width: context.widthOfScreen,
      height: context.heightOfScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _DesktopMenuWidget(
            onNavItemWebTap: onNavItemWebTap,
            appLogoColor: appLogoColor,
            controller: controller,
            titleColor: titleColor,
            selectedTitleColor: selectedTitleColor,
            selectedRouteName: selectedRouteName,
          ),
          Spacer(),
          Visibility(
            visible: hasSideTitle,
            child: Padding(
              padding: const EdgeInsets.only(left: Sizes.PADDING_12),
              child: RotatedBox(
                quarterTurns: 3,
                child: TextSlideBoxWidget(
                  controller: controller,
                  text: selectedRouteTitle.toUpperCase(),
                  textStyle: style,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class _DesktopMenuWidget extends StatelessWidget {
  final Function(String)? onNavItemWebTap;
  final Color appLogoColor;
  final AnimationController controller;
  final Color titleColor;
  final Color selectedTitleColor;
  final String selectedRouteName;

  const _DesktopMenuWidget({
    this.onNavItemWebTap,
    required this.appLogoColor,
    required this.controller,
    required this.titleColor,
    required this.selectedTitleColor,
    required this.selectedRouteName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(Sizes.RADIUS_20)),
          boxShadow: [BoxShadow(blurRadius: 5, color: AppColors.grey200)]),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLogo(titleColor: appLogoColor),
          Spacer(),
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(right: Sizes.PADDING_24),
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SpaceW24(),
            itemCount: Data.menuItems.length,
            itemBuilder: (context, index) {
              return Center(
                child: NavItem(
                  controller: controller,
                  title: Data.menuItems[index].name,
                  route: Data.menuItems[index].route,
                  titleColor: titleColor,
                  selectedColor: selectedTitleColor,
                  index: index + 1,
                  isSelected: Data.menuItems[index].route == selectedRouteName,
                  onTap: () => onNavItemWebTap?.call(Data.menuItems[index].route),
                ),
              );
            },
          ),
          PortfolioButton(
            height: Sizes.HEIGHT_36,
            hasIcon: false,
            width: 95,
            buttonColor: AppColors.white,
            borderColor: appLogoColor,
            onHoverColor: appLogoColor,
            title: StringConst.RESUME.toUpperCase(),
            borderRadius: Sizes.RADIUS_8,
            onPressed: () => Functions.launchUrl(DocumentPath.CV),
          ),
        ],
      ),
    );
  }
}
