import 'package:flutter_triple/flutter_triple.dart';
import 'package:portfolio/view_models/projects/projects_view_model.dart';
import 'package:portfolio/widgets/project_technology/project_technology_model.dart';

class ProjectsStore extends Store<ProjectsViewModel> {
  ProjectsStore() : super(ProjectsViewModel());

  void onTapTechnology(ProjectTechnology technology) {
    technology.isSelected = !technology.isSelected;
    update(state.copyWith(projectTechnologies: state.projectTechnologies));
  }
}
