import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';

import '../animated_line_through_text.dart';

const double indicatorWidth = Sizes.WIDTH_60;

class NavItemData {
  final String name;
  final String route;

  NavItemData({
    required this.name,
    required this.route,
  });
}

class NavItem extends StatefulWidget {
  const NavItem({
    super.key,
    required this.title,
    required this.route,
    required this.index,
    required this.controller,
    this.titleColor = AppColors.grey600,
    this.selectedColor = AppColors.black,
    this.isSelected = false,
    this.isMobile = false,
    this.titleStyle,
    this.onTap,
  });

  final String title;
  final int index;
  final String route;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color selectedColor;
  final bool isSelected;
  final bool isMobile;
  final AnimationController controller;
  final GestureTapCallback? onTap;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hoveringUnselectedNavItemMobile = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: Visibility(
          visible: widget.isMobile,
          replacement: _DesktopTextWidget(
            titleColor: widget.titleColor,
            selectedColor: widget.selectedColor,
            isSelected: widget.isSelected,
            titleStyle: widget.titleStyle,
            title: widget.title,
            controller: widget.controller,
          ),
          child: _MobileTextWidget(
            isSelected: widget.isSelected,
            opacity: _hoveringUnselectedNavItemMobile ? 1 : 0,
            index: widget.index,
            title: widget.title,
            titleStyle: widget.titleStyle,
            onEnter: (e) => _onMouseEnterUnselectedNavItemMobile(true),
            onExit: (e) => _onMouseEnterUnselectedNavItemMobile(false),
          ),
        ),
      ),
    );
  }

  void _onMouseEnterUnselectedNavItemMobile(bool hovering) {
    setState(() {
      _hoveringUnselectedNavItemMobile = hovering;
    });
  }
}

class _DesktopTextWidget extends StatelessWidget {
  final Color titleColor;
  final Color selectedColor;
  final bool isSelected;
  final TextStyle? titleStyle;
  final String title;
  final AnimationController controller;

  const _DesktopTextWidget({
    required this.titleColor,
    required this.selectedColor,
    required this.isSelected,
    this.titleStyle,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    double textSize = context.responsive(Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16, md: Sizes.TEXT_SIZE_15);

    TextStyle? defaultSelectedItemStyle = textTheme.bodyLarge?.copyWith(
      fontSize: textSize,
      color: selectedColor,
      fontWeight: FontWeight.w400,
    );

    TextStyle? defaultUnselectedItemStyle = textTheme.bodyLarge?.copyWith(fontSize: textSize, color: titleColor);

    return Visibility(
      visible: isSelected,
      replacement: AnimatedLineThroughText(
        text: title,
        isUnderlinedOnHover: false,
        hasOffsetAnimation: true,
        textStyle: titleStyle ?? defaultUnselectedItemStyle,
        onHoverTextStyle: defaultUnselectedItemStyle?.copyWith(
          color: selectedColor,
          fontWeight: FontWeight.w400,
        ),
      ),
      child: AnimatedLineThroughText(
        slideBoxCoverColor: AppColors.white,
        text: title,
        isUnderlinedOnHover: false,
        hasOffsetAnimation: true,
        hasSlideBoxAnimation: true,
        controller: controller,
        textStyle: titleStyle ?? defaultSelectedItemStyle,
      ),
    );
  }
}

class _MobileTextWidget extends StatelessWidget {
  final bool isSelected;
  final PointerEnterEventListener? onEnter;
  final PointerExitEventListener? onExit;
  final double opacity;
  final int index;
  final TextStyle? titleStyle;
  final String title;

  const _MobileTextWidget({
    required this.isSelected,
    required this.opacity,
    required this.index,
    required this.title,
    this.titleStyle,
    this.onEnter,
    this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    double indexTextSize = 80;
    double selectedTextSize = 36;
    double unselectedTextSize = 36;

    return Visibility(
      visible: isSelected,
      replacement: MouseRegion(
        onEnter: onEnter,
        onExit: onExit,
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  '0${index}',
                  style: titleStyle ??
                      textTheme.headlineLarge?.copyWith(
                        fontSize: indexTextSize,
                        color: AppColors.grey800,
                      ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: (indexTextSize - selectedTextSize) / 3),
              child: Align(
                alignment: Alignment.center,
                child: AnimatedLineThroughText(
                  text: title.toLowerCase(),
                  isUnderlinedOnHover: false,
                  textStyle: titleStyle ??
                      textTheme.bodyLarge?.copyWith(
                        fontSize: unselectedTextSize,
                        fontWeight: FontWeight.w400,
                      ),
                  hoverColor: AppColors.accentColor,
                  coverColor: AppColors.black,
                  lineThickness: 4,
                  onHoverTextStyle: textTheme.bodyLarge?.copyWith(
                    fontSize: unselectedTextSize,
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              '0${index}',
              style: titleStyle ??
                  textTheme.headlineLarge?.copyWith(
                    fontSize: indexTextSize,
                    color: AppColors.grey800,
                    // fontWeight: FontWeight.w400,
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: (indexTextSize - selectedTextSize) / 3),
            child: Align(
              alignment: Alignment.center,
              child: AnimatedLineThroughText(
                text: title.toLowerCase(),
                isUnderlinedOnHover: false,
                textStyle: titleStyle ??
                    textTheme.displaySmall?.copyWith(
                      fontSize: selectedTextSize,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w400,
                    ),
                hoverColor: AppColors.accentColor,
                coverColor: AppColors.black,
                lineThickness: 4,
                onHoverTextStyle: textTheme.displaySmall?.copyWith(
                  fontSize: selectedTextSize,
                  color: AppColors.accentColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
