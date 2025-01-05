import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/home/widgets/projects_display_widget.dart';
import 'package:portfolio/presentation/works/widgets/noteworthy_projects.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_footer.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_header.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';

class WorksPage extends StatefulWidget {
  const WorksPage({super.key});

  @override
  State<WorksPage> createState() => _WorksPageState();
}

class _WorksPageState extends State<WorksPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _headingTextController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _headingTextController = AnimationController(vsync: this, duration: Duration(milliseconds: 1200));
  }

  @override
  void dispose() {
    _controller.dispose();
    _headingTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: context.responsive(context.assignWidth(.1), context.assignWidth(.15)),
      right: context.responsive(context.assignWidth(.1), context.assignWidth(.1)),
    );

    return PageWrapper(
      selectedRoute: Routes.work,
      selectedPageName: StringConst.WORKS,
      navBarAnimationController: _headingTextController,
      onLoadingAnimationDone: _headingTextController.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          PageHeader(headingText: StringConst.WORKS, headingTextController: _headingTextController),
          ProjectsDisplayWidget(),
          CustomSpacer(heightFactor: .1),
          Padding(padding: padding, child: NoteWorthyProjects()),
          CustomSpacer(heightFactor: .15),
          AnimatedFooter(),
        ],
      ),
    );
  }
}
