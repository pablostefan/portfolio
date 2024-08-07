import 'package:portfolio/ui_helpers/app_vectors.dart';

class ProjectTechnology {
  final String name;
  final AppVectors icon;
  bool isSelected;

  ProjectTechnology({
    required this.name,
    required this.icon,
    this.isSelected = false,
  });
}

extension ProjectTechnologyExtension on List<ProjectTechnology> {
  String get selectedTechnologies {
    return where((technology) => technology.isSelected).map((technology) => technology.name).toList().join("; ");
  }
}
