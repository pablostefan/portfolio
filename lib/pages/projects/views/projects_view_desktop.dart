import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/stores/projects/projects_store.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_links.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';
import 'package:portfolio/view_models/projects/projects_view_model.dart';
import 'package:portfolio/widgets/expansion_title/expansion_title_item_widget.dart';
import 'package:portfolio/widgets/expansion_title/expansion_title_widget.dart';
import 'package:portfolio/widgets/project_technology/project_technology_model.dart';
import 'package:portfolio/widgets/project_technology/project_technology_widget.dart';
import 'package:portfolio/widgets/selectable_expansion_title/selectable_expansion_title_widget.dart';

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
                    child: ListView(children: [
                      SelectableExpansionTileWidget(title: AppLocale.technologies.getString(context), children: [
                        ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: AppSpacing.xxs),
                            itemCount: triple.state.projectTechnologies.length,
                            separatorBuilder: (_, index) => const SizedBox(height: AppSpacing.micro),
                            itemBuilder: (_, index) => ProjectTechnologyWidget(
                                projectTechnology: triple.state.projectTechnologies[index],
                                onTap: _store.onTapTechnology)),
                      ]),
                      ExpansionTileWidget(
                          title: AppLocale.contacts.getString(context),
                          childrenPadding: const EdgeInsets.only(left: AppSpacing.nano, top: AppSpacing.femto),
                          children: [
                            ExpansionTitleItemWidget(icon: AppVectors.mail, title: AppLinks.email, onTap: () {}),
                            ExpansionTitleItemWidget(icon: AppVectors.phone, title: AppLinks.phone, onTap: () {}),
                          ]),
                    ])),
                Expanded(
                    child: Column(children: [
                  Visibility(
                      visible: triple.state.projectTechnologies.selectedTechnologies.isNotEmpty,
                      child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.micro),
                          decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: AppColors.border),
                                  right: BorderSide(color: AppColors.border))),
                          child: Text("${triple.state.projectTechnologies.selectedTechnologies};")
                              .bodyExtraSmallRegular()
                              .color(AppColors.secondaryOne))),
                ]))
              ]));
        });
  }
}
