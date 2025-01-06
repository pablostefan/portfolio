import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/home/widgets/home_page_header.dart';
import 'package:portfolio/presentation/home/widgets/loading_page.dart';
import 'package:portfolio/presentation/home/widgets/more_project_widget.dart';
import 'package:portfolio/presentation/home/widgets/projects_display_widget.dart';
import 'package:portfolio/presentation/home/widgets/recent_projects_widget.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_footer.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';

class HomePage extends StatefulWidget {
  final bool showAnimation;

  const HomePage({super.key, required this.showAnimation});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey _scrollKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _viewProjectsController;
  late final AnimationController _slideTextController;

  @override
  void initState() {
    super.initState();
    _viewProjectsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
  }

  @override
  void dispose() {
    _viewProjectsController.dispose();
    _slideTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PageWrapper(
      selectedRoute: Routes.home,
      selectedPageName: StringConst.HOME,
      navBarAnimationController: _slideTextController,
      hasSideTitle: false,
      hasUnveilPageAnimation: widget.showAnimation,
      onLoadingAnimationDone: _slideTextController.forward,
      hasCustomAnimation: true,
      customLoadingAnimation: LoadingHomePageAnimation(
        text: StringConst.DEV_NAME,
        style: textTheme.headlineSmall!.copyWith(color: AppColors.white),
        onLoadingDone: _slideTextController.forward,
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        children: [
          HomePageHeader(controller: _slideTextController, scrollToWorksKey: _scrollKey),
          CustomSpacer(heightFactor: context.responsive(.1, .1, md: .05)),
          RecentProjectsWidget(),
          CustomSpacer(heightFactor: context.responsive(.1, .1, md: .05)),
          ProjectsDisplayWidget(),
          CustomSpacer(heightFactor: context.responsive(.1, .1, md: .05)),
          MoreProjectWidget(),
          CustomSpacer(heightFactor: context.responsive(.1, .1, md: .05)),
          const AnimatedFooter(),
        ],
      ),
    );
  }
}
