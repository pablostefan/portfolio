import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/project_detail/widgets/about_project.dart';
import 'package:portfolio/presentation/project_detail/widgets/next_project.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/project_item.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

class ProjectDetailPage extends StatefulWidget {
  final String project;

  const ProjectDetailPage({super.key, required this.project});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _waveController;
  late AnimationController _aboutProjectController;
  late AnimationController _projectDataController;
  double waveLineHeight = 100;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(vsync: this, duration: Animations.waveDuration)..repeat();

    _controller = AnimationController(vsync: this, duration: Animations.slideAnimationDurationLong);

    _aboutProjectController = AnimationController(vsync: this, duration: Animations.slideAnimationDurationShort);

    _waveController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _waveController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _waveController.forward();
      }
    });

    _projectDataController = AnimationController(vsync: this, duration: Animations.slideAnimationDurationShort);

    _waveController.forward();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _aboutProjectController.dispose();
    _controller.dispose();
    super.dispose();
  }

  int get _index {
    try {
      return Data.recentWorks.indexWhere((element) => element.title == widget.project);
    } catch (e) {
      return 0;
    }
  }

  ProjectItemData get _projectDetails => Data.recentWorks[_index];

  bool get _isLastProject => _index == Data.recentWorks.length - 1;

  ProjectItemData? get _nextProject {
    try {
      return Data.recentWorks[_index + 1];
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = EdgeInsets.only(
      top: context.responsive(context.assignHeight(.05), context.assignHeight(.1)),
      left: context.responsive(context.assignWidth(.1), context.assignWidth(.15)),
      right: context.responsive(context.assignWidth(.1), context.assignWidth(.25)),
    );

    double contentAreaWidth = context.responsive(context.assignWidth(.6), context.assignWidth(.8));

    return PageWrapper(
      backgroundColor: AppColors.white,
      selectedRoute: Routes.projectDetail,
      hasSideTitle: false,
      selectedPageName: StringConst.PROJECT,
      navBarAnimationController: _controller,
      navBarTitleColor: _projectDetails.navTitleColor,
      navBarSelectedTitleColor: _projectDetails.navSelectedTitleColor,
      appLogoColor: _projectDetails.appLogoColor,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Hero(
            tag: _projectDetails.title,
            child: Container(
              color: _projectDetails.primaryColor,
              padding: EdgeInsets.only(top: 70),
              child: Image.asset(
                _projectDetails.coverUrl,
                fit: BoxFit.fitWidth,
                width: context.widthOfScreen,
              ),
            ),
          ),
          VisibilityDetectorWidget(
            key: Key('about-project'),
            context: context,
            minVisible: 40,
            action: _aboutProjectController.forward,
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: AboutProject(
                  projectData: _projectDetails,
                  controller: _aboutProjectController,
                  projectDataController: _projectDataController,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          Visibility(
            visible: !_isLastProject,
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: NextProject(
                  width: contentAreaWidth,
                  nextProject: _nextProject,
                  navigateToNextProject: () => context.go(Routes.projectDetailRoute(_nextProject?.title)),
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: .15),
          SimpleFooter(),
        ],
      ),
    );
  }
}
