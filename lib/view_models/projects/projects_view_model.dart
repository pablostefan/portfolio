import 'package:portfolio/models/project_technology.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';

class ProjectsViewModel {
  List<ProjectTechnology> projectTechnologies = [
    ProjectTechnology(name: 'Flutter', icon: AppVectors.flutterIcon),
    ProjectTechnology(name: 'Swift', icon: AppVectors.swiftIcon),
    ProjectTechnology(name: 'Android', icon: AppVectors.androidIcon),
    ProjectTechnology(name: 'React', icon: AppVectors.reactIcon),
  ];

  ProjectsViewModel copyWith({
    List<ProjectTechnology>? projectTechnologies,
  }) {
    return ProjectsViewModel()..projectTechnologies = projectTechnologies ?? this.projectTechnologies;
  }
}
