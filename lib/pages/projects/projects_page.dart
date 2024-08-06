import 'package:flutter/material.dart';
import 'package:portfolio/pages/projects/views/projects_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const ProjectsViewDesktop(),
        tablet: (_) => const ProjectsViewDesktop(),
        desktop: (_) => const ProjectsViewDesktop());
  }
}
