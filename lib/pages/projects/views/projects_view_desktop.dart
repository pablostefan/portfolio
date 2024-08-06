import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/stores/projects/projects_store.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/view_models/projects/projects_view_model.dart';

class ProjectsViewDesktop extends StatefulWidget {
  const ProjectsViewDesktop({super.key});

  @override
  State<ProjectsViewDesktop> createState() => _ProjectsViewDesktopState();
}

class _ProjectsViewDesktopState extends State<ProjectsViewDesktop> {
  final ProjectsStore _store = GetIt.I<ProjectsStore>();

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<ProjectsStore, ProjectsViewModel>(
        store: _store,
        builder: (_, triple) {
          return SafeArea(
              left: false,
              right: false,
              child: Row(children: [
                Container(
                    width: AppSpacing.extraGiant,
                    decoration:
                        const BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: AppColors.border))),
                    child: ListView(children: []))
              ]));
        });
  }
}
