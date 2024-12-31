import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/app_drawer.dart';
import 'package:portfolio/shared/widgets/empty.dart';
import 'package:portfolio/shared/widgets/nav_bar.dart';

import 'loading_slider.dart';

class NavigationArguments {
  bool showUnVeilPageAnimation;
  bool reverseAnimationOnPop;

  NavigationArguments({
    this.showUnVeilPageAnimation = true,
    this.reverseAnimationOnPop = true,
  });
}

class PageWrapper extends StatefulWidget {
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
  });

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

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> with TickerProviderStateMixin {
  late final AnimationController _forwardSlideController;
  late final AnimationController _unveilPageSlideController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  static const _animationDuration = Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();

    _forwardSlideController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _unveilPageSlideController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _initializeUnveilAnimation();
  }

  void _initializeUnveilAnimation() {
    if (widget.hasUnveilPageAnimation) {
      _unveilPageSlideController.forward();
      _unveilPageSlideController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onLoadingAnimationDone?.call();
        }
      });
    }
  }

  @override
  void dispose() {
    _forwardSlideController.dispose();
    _unveilPageSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _handleReverseAnimationOnPop();

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
          _buildNavBar(context),
          _buildLoadingSlider(context, _forwardSlideController),
          _buildUnveilPageAnimation(context),
        ],
      ),
    );
  }

  void _handleReverseAnimationOnPop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_forwardSlideController.isCompleted && widget.reverseAnimationOnPop) {
        _forwardSlideController.reverse();
      }
    });
  }

  Widget _buildNavBar(BuildContext context) {
    return NavBar(
      selectedRouteTitle: widget.selectedPageName,
      controller: widget.navBarAnimationController,
      selectedRouteName: widget.selectedRoute,
      hasSideTitle: widget.hasSideTitle,
      appLogoColor: widget.appLogoColor,
      titleColor: widget.navBarTitleColor,
      selectedTitleColor: widget.navBarSelectedTitleColor,
      onNavItemWebTap: (route) => _navigateToRoute(context, route),
      onMenuTap: _toggleDrawer,
    );
  }

  Widget _buildLoadingSlider(BuildContext context, AnimationController controller) {
    return LoadingSlider(
      controller: controller,
      width: widthOfScreen(context),
      height: heightOfScreen(context),
    );
  }

  Widget _buildUnveilPageAnimation(BuildContext context) {
    return Visibility(
      visible: widget.hasUnveilPageAnimation,
      replacement: widget.customLoadingAnimation,
      child: Positioned(
        right: 0,
        child: LoadingSlider(
          controller: _unveilPageSlideController,
          curve: Curves.fastOutSlowIn,
          width: widthOfScreen(context),
          height: heightOfScreen(context),
          isSlideForward: false,
        ),
      ),
    );
  }

  void _navigateToRoute(BuildContext context, String route) {
    _forwardSlideController.forward();
    _forwardSlideController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (route == Routes.home) {
          Navigator.of(context).pushNamed(
            route,
            arguments: NavigationArguments(showUnVeilPageAnimation: true),
          );
        } else {
          Navigator.of(context).pushNamed(route);
        }
      }
    });
  }

  void _toggleDrawer() {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      _scaffoldKey.currentState?.openDrawer();
    }
  }
}
