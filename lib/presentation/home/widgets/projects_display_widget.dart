import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/project_item.dart';

class ProjectsDisplayWidget extends StatelessWidget {
  const ProjectsDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final projectItemHeight = context.assignHeight(0.4);
    final subHeight = projectItemHeight * 0.75;
    final extraHeight = projectItemHeight - subHeight;

    return AdaptiveBuilderWidget(
      tabletSmall: Column(
        children: _buildProjectsForMobile(
          data: Data.recentWorks,
          projectHeight: projectItemHeight.toInt(),
          subHeight: subHeight.toInt(),
          context: context,
        ),
      ),
      desktop: SizedBox(
        height: subHeight * Data.recentWorks.length + extraHeight,
        child: Stack(
          children: _buildProjectsDesktop(
            data: Data.recentWorks,
            context: context,
            projectHeight: projectItemHeight.toInt(),
            subHeight: subHeight.toInt(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildProjectsDesktop({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
    required BuildContext context,
  }) {
    final items = <Widget>[];
    int margin = subHeight * (data.length - 1);

    for (int index = data.length - 1; index >= 0; index--) {
      items.add(
        Container(
          margin: EdgeInsets.only(top: margin.toDouble()),
          child: ProjectItemLg(
            projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
            imageUrl: data[index].image,
            projectItemHeight: projectHeight.toDouble(),
            subHeight: subHeight.toDouble(),
            backgroundColor: AppColors.accentColor2.withOpacity(0.35),
            title: data[index].title.toLowerCase(),
            subtitle: data[index].category,
            containerColor: data[index].primaryColor,
            onTap: () => Functions.navigateToProject(
              context: context,
              dataSource: data,
              currentProject: data[index],
              currentProjectIndex: index,
            ),
          ),
        ),
      );
      margin -= subHeight;
    }
    return items;
  }

  List<Widget> _buildProjectsForMobile({
    required List<ProjectItemData> data,
    required int projectHeight,
    required int subHeight,
    required BuildContext context,
  }) {
    return [
      for (int index = 0; index < data.length; index++) ...[
        ProjectItemSm(
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageUrl: data[index].image,
          title: data[index].title.toLowerCase(),
          subtitle: data[index].category,
          containerColor: data[index].primaryColor,
          onTap: () => Functions.navigateToProject(
            context: context,
            dataSource: data,
            currentProject: data[index],
            currentProjectIndex: index,
          ),
        ),
        const CustomSpacer(heightFactor: 0.17),
      ],
    ];
  }
}
