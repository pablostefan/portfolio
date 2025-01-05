import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/app_logo.dart';
import 'package:portfolio/shared/widgets/nav_bar_widget/nav_item.dart';
import 'package:portfolio/shared/widgets/socials.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({
    super.key,
    required this.menuList,
    required this.selectedItemRouteName,
    required this.controller,
    this.color = AppColors.black,
    this.width,
    this.onClose,
  });

  final String selectedItemRouteName;
  final List<NavItemData> menuList;
  final Color color;
  final AnimationController controller;
  final double? width;
  final GestureTapCallback? onClose;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with SingleTickerProviderStateMixin {
  static const Duration _initialDelayTime = Duration(milliseconds: 50);
  static const Duration _itemSlideTime = Duration(milliseconds: 400);
  static const Duration _staggerTime = Duration(milliseconds: 50);
  static const Duration _buttonDelayTime = Duration(milliseconds: 100);
  static const Duration _buttonTime = Duration(milliseconds: 400);
  late Duration _animationDuration;

  late AnimationController _staggeredController;
  final List<Interval> _itemSlideIntervals = [];

  @override
  void initState() {
    super.initState();
    _animationDuration = _initialDelayTime + (_staggerTime * widget.menuList.length) + _buttonDelayTime + _buttonTime;
    _createAnimationIntervals();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < widget.menuList.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey500, fontSize: Sizes.TEXT_SIZE_10);

    return SizedBox(
      width: widget.width ?? context.widthOfScreen,
      height: context.heightOfScreen,
      child: Drawer(
        child: Container(
          color: widget.color,
          width: widget.width ?? context.widthOfScreen,
          height: context.heightOfScreen,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(Sizes.PADDING_24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        AppLogo(
                          fontSize: Sizes.TEXT_SIZE_40,
                          titleColor: AppColors.accentColor,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            widget.onClose ?? context.pop();
                          },
                          child: Icon(
                            FeatherIcons.x,
                            size: Sizes.ICON_SIZE_30,
                            color: AppColors.accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.menuList.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return MenuItemWidget(
                          staggeredController: _staggeredController,
                          interval: _itemSlideIntervals[index],
                          item: widget.menuList[index],
                          index: index,
                          controller: widget.controller,
                          selectedItemRouteName: widget.selectedItemRouteName,
                        );
                      },
                    ),
                  ),
                  Text(StringConst.COPYRIGHT, style: style),
                  SpaceH20(),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Sizes.MARGIN_24,
                    bottom: context.assignHeight(0.1),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Socials(
                      socialData: Data.socialData,
                      size: 18,
                      isHorizontal: false,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final AnimationController staggeredController;
  final AnimationController controller;
  final Interval interval;
  final NavItemData item;
  final int index;
  final String selectedItemRouteName;

  const MenuItemWidget({
    super.key,
    required this.staggeredController,
    required this.interval,
    required this.item,
    required this.index,
    required this.controller,
    required this.selectedItemRouteName,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: staggeredController,
      builder: (context, child) {
        final animationPercent = Curves.easeOut.transform(interval.transform(controller.value));
        final opacity = animationPercent;
        final slideDistance = (1.0 - animationPercent) * 150;

        return Opacity(opacity: opacity, child: Transform.translate(offset: Offset(slideDistance, 0), child: child));
      },
      child: NavItem(
        controller: controller,
        onTap: () => context.go(item.route, extra: item.route == Routes.home),
        index: index + 1,
        route: item.route,
        title: item.name,
        isMobile: true,
        isSelected: selectedItemRouteName == item.route,
      ),
    );
  }
}
