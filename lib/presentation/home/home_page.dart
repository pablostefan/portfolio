import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/home/widgets/home_page_header.dart';
import 'package:portfolio/presentation/home/widgets/loading_page.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptative_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_footer.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_slide_transition.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/project_item.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey _scrollKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _viewProjectsController;
  late final AnimationController _recentWorksController;
  late final AnimationController _slideTextController;
  late NavigationArguments _arguments;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _viewProjectsController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _recentWorksController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
  }

  void _retrieveArguments() {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    _arguments = args == null ? NavigationArguments(showUnVeilPageAnimation: false) : args as NavigationArguments;
  }

  @override
  void dispose() {
    _viewProjectsController.dispose();
    _slideTextController.dispose();
    _recentWorksController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _retrieveArguments();

    final projectItemHeight = context.assignHeight(0.4);
    final subHeight = projectItemHeight * 0.75;
    final extraHeight = projectItemHeight - subHeight;

    final textTheme = Theme.of(context).textTheme;
    final textButtonStyle = textTheme.headlineSmall?.copyWith(
      color: AppColors.black,
      fontSize: context.responsiveSize(30, 40, md: 36, sm: 32),
      height: 2.0,
    );

    final margin = EdgeInsets.only(
      left: context.responsiveSize(context.assignWidth(0.1), context.assignWidth(0.15), sm: context.assignWidth(0.15)),
    );

    return PageWrapper(
      selectedRoute: Routes.home,
      selectedPageName: StringConst.HOME,
      navBarAnimationController: _slideTextController,
      hasSideTitle: false,
      hasUnveilPageAnimation: _arguments.showUnVeilPageAnimation,
      onLoadingAnimationDone: _slideTextController.forward,
      hasCustomAnimation: true,
      customLoadingAnimation: _buildLoadingAnimation(textTheme),
      child: _buildContent(
        context,
        projectItemHeight: projectItemHeight,
        subHeight: subHeight,
        extraHeight: extraHeight,
        margin: margin,
        textButtonStyle: textButtonStyle,
      ),
    );
  }

  Widget _buildLoadingAnimation(TextTheme textTheme) {
    return LoadingHomePageAnimation(
      text: StringConst.DEV_NAME,
      style: textTheme.headlineSmall!.copyWith(color: AppColors.white),
      onLoadingDone: _slideTextController.forward,
    );
  }

  Widget _buildContent(
    BuildContext context, {
    required double projectItemHeight,
    required double subHeight,
    required double extraHeight,
    required EdgeInsets margin,
    required TextStyle? textButtonStyle,
  }) {
    return ListView(
      padding: EdgeInsets.zero,
      controller: _scrollController,
      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        HomePageHeader(controller: _slideTextController, scrollToWorksKey: _scrollKey),
        const CustomSpacer(heightFactor: 0.1),
        _buildRecentProjectsSection(context, margin),
        const CustomSpacer(heightFactor: 0.1),
        _buildProjectsDisplay(context, projectItemHeight, subHeight, extraHeight),
        const CustomSpacer(heightFactor: 0.05),
        _buildMoreProjectsSection(context, margin, textButtonStyle),
        const CustomSpacer(heightFactor: 0.15),
        const AnimatedFooter(),
      ],
    );
  }

  Widget _buildRecentProjectsSection(BuildContext context, EdgeInsets margin) {
    final textTheme = Theme.of(context).textTheme;

    return VisibilityDetectorWidget(
      key: const Key('recent-projects'),
      context: context,
      minVisible: 40,
      action: _recentWorksController.forward,
      child: Container(
        margin: margin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedTextSlideBoxTransition(
              controller: _recentWorksController,
              text: StringConst.CRAFTED_WITH_LOVE,
              textStyle: textTheme.headlineSmall?.copyWith(
                color: AppColors.black,
                fontSize: context.responsiveSize(30, 48, md: 40, sm: 36),
                height: 2.0,
              ),
            ),
            const SpaceH16(),
            AnimatedPositionedText(
              controller: CurvedAnimation(
                parent: _recentWorksController,
                curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
              ),
              text: StringConst.SELECTION,
              textStyle: textTheme.bodyLarge?.copyWith(
                fontSize: context.responsiveSize(Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18),
                height: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectsDisplay(
    BuildContext context,
    double projectItemHeight,
    double subHeight,
    double extraHeight,
  ) {
    return AdaptiveBuilderWidget(
      tabletSmall: Column(
        children: _buildProjectsForMobile(
          data: Data.recentWorks,
          projectHeight: projectItemHeight.toInt(),
          subHeight: subHeight.toInt(),
        ),
      ),
      desktop: SizedBox(
        height: subHeight * Data.recentWorks.length + extraHeight,
        child: Stack(
          children: _buildRecentProjects(
            data: Data.recentWorks,
            projectHeight: projectItemHeight.toInt(),
            subHeight: subHeight.toInt(),
          ),
        ),
      ),
    );
  }

  Widget _buildMoreProjectsSection(
    BuildContext context,
    EdgeInsets margin,
    TextStyle? textButtonStyle,
  ) {
    return Container(
      margin: margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.THERES_MORE.toUpperCase(),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: context.responsiveSize(11, Sizes.TEXT_SIZE_12),
                  letterSpacing: 2,
                  fontWeight: FontWeight.w300,
                ),
          ),
          const SpaceH16(),
          MouseRegion(
            onEnter: (_) => _viewProjectsController.forward(),
            onExit: (_) => _viewProjectsController.reverse(),
            child: AnimatedSlideTransition(
              controller: _viewProjectsController,
              beginOffset: const Offset(0, 0),
              targetOffset: const Offset(0.05, 0),
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, Routes.work),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      StringConst.VIEW_ALL_PROJECTS.toLowerCase(),
                      style: textButtonStyle,
                    ),
                    const SpaceW12(),
                    Image.asset(
                      ImagePath.ARROW_RIGHT,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRecentProjects({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    final items = <Widget>[];
    int margin = subHeight * (data.length - 1);

    for (int index = data.length - 1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItemLg(
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].image,
            projectItemHeight: projectHeight.toDouble(),
            subHeight: subHeight.toDouble(),
            backgroundColor: AppColors.accentColor2.withOpacity(0.35),
            title: data[index].title.toLowerCase(),
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () => Functions.navigateToProject(
              context: context,
              dataSource: data,
              currentProject: data[index],
              currentProjectIndex: index,
            ),
          ),
        ),
      );
      margin -= subHeight;
    }
    return items;
  }

  List<Widget> _buildProjectsForMobile({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
  }) {
    return [
      for (int index = 0; index < data.length; index++) ...[
        ProjectItemSm(
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageUrl: data[index].image,
          title: data[index].title.toLowerCase(),
          subtitle: data[index].category,
          containerColor: data[index].primaryColor,
          onTap: () => Functions.navigateToProject(
            context: context,
            dataSource: data,
            currentProject: data[index],
            currentProjectIndex: index,
          ),
        ),
        const CustomSpacer(heightFactor: 0.17),
      ],
    ];
  }
}
