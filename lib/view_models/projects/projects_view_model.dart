import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';
import 'package:portfolio/widgets/project_technology/project_technology_model.dart';

class ProjectsViewModel {
  List<ProjectTechnology> projectTechnologies = [
    ProjectTechnology(name: AppLocale.flutter, icon: AppVectors.flutterIcon),
    ProjectTechnology(name: AppLocale.swift, icon: AppVectors.swiftIcon),
    ProjectTechnology(name: AppLocale.android, icon: AppVectors.androidIcon),
    ProjectTechnology(name: AppLocale.react, icon: AppVectors.reactIcon),
  ];

  ProjectsViewModel copyWith({
    List<ProjectTechnology>? projectTechnologies,
  }) {
    return ProjectsViewModel()..projectTechnologies = projectTechnologies ?? this.projectTechnologies;
  }
}
