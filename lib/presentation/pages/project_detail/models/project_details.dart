import 'dart:convert';

import 'package:portfolio/presentation/widgets/project_item.dart';

class ProjectDetailArguments {
  final ProjectItemData data;
  final List<ProjectItemData> dataSource;
  final int currentIndex;
  final ProjectItemData? nextProject;
  final bool hasNextProject;

  ProjectDetailArguments({
    required this.dataSource,
    required this.data,
    required this.currentIndex,
    required this.hasNextProject,
    this.nextProject,
  });

  factory ProjectDetailArguments.fromMap(Map<String, dynamic> map) {
    return ProjectDetailArguments(
      data: ProjectItemData.fromMap(map['data']),
      dataSource: List<ProjectItemData>.from(map['dataSource']?.map((x) => ProjectItemData.fromMap(x))),
      currentIndex: map['currentIndex'],
      nextProject: map['nextProject'] != null ? ProjectItemData.fromMap(map['nextProject']) : null,
      hasNextProject: map['hasNextProject'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'dataSource': dataSource.map((x) => x.toMap()).toList(),
      'currentIndex': currentIndex,
      'nextProject': nextProject?.toMap(),
      'hasNextProject': hasNextProject,
    };
  }

  String toJson() => json.encode(toMap());
}
