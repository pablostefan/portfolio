import 'dart:convert';
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/pages/project_detail/models/project_details.dart';
import 'package:portfolio/presentation/pages/project_detail/widgets/about_project.dart';
import 'package:portfolio/presentation/pages/project_detail/widgets/next_project.dart';
import 'package:portfolio/presentation/pages/widgets/simple_footer.dart';
import 'package:portfolio/presentation/widgets/content_area.dart';
import 'package:portfolio/presentation/widgets/custom_spacer.dart';
import 'package:portfolio/presentation/widgets/page_wrapper.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/values/values.dart';
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
  late ProjectDetailArguments projectDetails;
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
      projectDetails = args as ProjectDetailArguments;
      html.window.localStorage['projectDetailArguments'] = args.toJson();
    } else {
      final storedArguments = html.window.localStorage['projectDetailArguments'];
      if (storedArguments != null) {
        projectDetails = ProjectDetailArguments.fromMap(json.decode(storedArguments));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    getArguments();

    EdgeInsetsGeometry padding = EdgeInsets.only(
      top: responsiveSize(
        context,
        assignHeight(context, .05),
        assignHeight(context, .1),
      ),
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.25),
      ),
    );
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.60),
      assignWidth(context, 0.80),
    );
    return PageWrapper(
      backgroundColor: AppColors.white,
      selectedRoute: Routes.projectDetail,
      hasSideTitle: false,
      selectedPageName: StringConst.PROJECT,
      navBarAnimationController: _controller,
      navBarTitleColor: projectDetails.data.navTitleColor,
      navBarSelectedTitleColor: projectDetails.data.navSelectedTitleColor,
      appLogoColor: projectDetails.data.appLogoColor,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Container(
            color: projectDetails.data.primaryColor,
            padding: EdgeInsets.only(top: 70),
            child: Image.asset(
              projectDetails.data.coverUrl,
              fit: BoxFit.fitWidth,
              width: widthOfScreen(context),
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
                  projectData: projectDetails.data,
                  controller: _aboutProjectController,
                  projectDataController: _projectDataController,
                  width: contentAreaWidth,
                ),
              ),
            ),
          ),
          Visibility(
            visible: projectDetails.hasNextProject,
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: NextProject(
                  width: contentAreaWidth,
                  nextProject: projectDetails.nextProject,
                  navigateToNextProject: () {
                    Functions.navigateToProject(
                      context: context,
                      dataSource: projectDetails.dataSource,
                      currentProject: projectDetails.nextProject!,
                      currentProjectIndex: projectDetails.currentIndex + 1,
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
