import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/project_detail/models/project_details.dart';
import 'package:portfolio/presentation/project_detail/widgets/about_project.dart';
import 'package:portfolio/presentation/project_detail/widgets/next_project.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({super.key});

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _waveController;
  late AnimationController _aboutProjectController;
  late AnimationController _projectDataController;
  late ProjectDetailArguments _projectDetails;
  double waveLineHeight = 100;

  @override
  void initState() {
    super.initState();
    _waveController = AnimationController(
      vsync: this,
      duration: Animations.waveDuration,
    )..repeat();
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _aboutProjectController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationShort,
    );
    _waveController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _waveController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _waveController.forward();
      }
    });
    _projectDataController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationShort,
    );
    _waveController.forward();
  }

  @override
  void dispose() {
    _waveController.dispose();
    _aboutProjectController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void getArguments() {
    final Object? args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      _projectDetails = args as ProjectDetailArguments;
      html.window.localStorage['projectDetailArguments'] = args.toJson();
    } else {
      final storedArguments = html.window.localStorage['projectDetailArguments'];
      if (storedArguments != null) {
        _projectDetails = ProjectDetailArguments.fromMap(json.decode(storedArguments));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getArguments();

    EdgeInsetsGeometry padding = EdgeInsets.only(
      top: context.responsiveSize(
        context.assignHeight(.05),
        context.assignHeight(.1),
      ),
      left: context.responsiveSize(
        context.assignWidth(.10),
        context.assignWidth(.15),
      ),
      right: context.responsiveSize(context.assignWidth(.1), context.assignWidth(.25)),
    );

    double contentAreaWidth = context.responsiveSize(
      context.assignWidth(.6),
      context.assignWidth(.8),
    );

    return PageWrapper(
      backgroundColor: AppColors.white,
      selectedRoute: Routes.projectDetail,
      hasSideTitle: false,
      selectedPageName: StringConst.PROJECT,
      navBarAnimationController: _controller,
      navBarTitleColor: _projectDetails.data.navTitleColor,
      navBarSelectedTitleColor: _projectDetails.data.navSelectedTitleColor,
      appLogoColor: _projectDetails.data.appLogoColor,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Hero(
            tag: _projectDetails.data.title,
            child: Container(
              color: _projectDetails.data.primaryColor,
              padding: EdgeInsets.only(top: 70),
              child: Image.asset(
                _projectDetails.data.coverUrl,
                fit: BoxFit.fitWidth,
                width: context.widthOfScreen,
              ),
            ),
          ),
          VisibilityDetector(
            key: Key('about-project'),
            onVisibilityChanged: (visibilityInfo) {
              double visiblePercentage = visibilityInfo.visibleFraction * 100;
              if (visiblePercentage > 40) {
                _aboutProjectController.forward();
              }
            },
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: AboutProject(
                  projectData: _projectDetails.data,
                  controller: _aboutProjectController,
                  projectDataController: _projectDataController,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          Visibility(
            visible: _projectDetails.hasNextProject,
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: NextProject(
                  width: contentAreaWidth,
                  nextProject: _projectDetails.nextProject,
                  navigateToNextProject: () {
                    Functions.navigateToProject(
                      context: context,
                      dataSource: _projectDetails.dataSource,
                      currentProject: _projectDetails.nextProject!,
                      currentProjectIndex: _projectDetails.currentIndex + 1,
                    );
                  },
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }
}
