import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/app_drawer.dart';
import 'package:portfolio/shared/widgets/empty.dart';
import 'package:portfolio/shared/widgets/nav_bar_widget/nav_bar.dart';

class NavigationArguments {
  bool showUnVeilPageAnimation;
  bool reverseAnimationOnPop;

  NavigationArguments({
    this.showUnVeilPageAnimation = true,
    this.reverseAnimationOnPop = true,
  });
}

class PageWrapper extends StatefulWidget {
  final String selectedRoute;
  final String selectedPageName;
  final AnimationController navBarAnimationController;
  final VoidCallback? onLoadingAnimationDone;
  final Widget child;
  final Widget customLoadingAnimation;
  final bool hasSideTitle;
  final bool hasUnveilPageAnimation;
  final bool reverseAnimationOnPop;
  final Color? backgroundColor;
  final Color navBarTitleColor;
  final Color navBarSelectedTitleColor;
  final Color appLogoColor;
  final bool hasCustomAnimation;

  const PageWrapper({
    super.key,
    required this.selectedRoute,
    required this.selectedPageName,
    required this.navBarAnimationController,
    required this.child,
    this.customLoadingAnimation = const Empty(),
    this.onLoadingAnimationDone,
    this.hasSideTitle = true,
    this.hasUnveilPageAnimation = true,
    this.reverseAnimationOnPop = true,
    this.backgroundColor,
    this.navBarTitleColor = AppColors.grey600,
    this.navBarSelectedTitleColor = AppColors.black,
    this.appLogoColor = AppColors.black,
    this.hasCustomAnimation = false,
  });

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _checkLoadingAnimationStatus();
  }

  void _checkLoadingAnimationStatus() {
    if (!widget.hasUnveilPageAnimation && widget.hasCustomAnimation) return;
    widget.onLoadingAnimationDone?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: widget.backgroundColor,
      drawer: AppDrawer(
        controller: widget.navBarAnimationController,
        menuList: Data.menuItems,
        selectedItemRouteName: widget.selectedRoute,
      ),
      body: Stack(
        children: [
          widget.child,
          NavBar(
            selectedRouteTitle: widget.selectedPageName,
            controller: widget.navBarAnimationController,
            selectedRouteName: widget.selectedRoute,
            hasSideTitle: widget.hasSideTitle,
            appLogoColor: widget.appLogoColor,
            titleColor: widget.navBarTitleColor,
            selectedTitleColor: widget.navBarSelectedTitleColor,
            onNavItemWebTap: (route) => context.go(route, extra: true),
            onMenuTap: _toggleDrawer,
          ),
          Visibility(
            visible: !widget.hasUnveilPageAnimation && widget.hasCustomAnimation,
            child: widget.customLoadingAnimation,
          )
        ],
      ),
    );
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }
}
