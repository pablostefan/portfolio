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
    int margin = subHeight.toInt() * (Data.recentWorks.length - 1);

    return AdaptiveBuilderWidget(
      tabletSmall: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Data.recentWorks.length,
        separatorBuilder: (_, __) => const CustomSpacer(heightFactor: 0.17),
        itemBuilder: (_, index) => ProjectItemSm(
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageUrl: Data.recentWorks[index].image,
          title: Data.recentWorks[index].title,
          subtitle: Data.recentWorks[index].category,
          containerColor: Data.recentWorks[index].primaryColor,
          onTap: () => Functions.navigateToProject(
            context: context,
            dataSource: Data.recentWorks,
            currentProject: Data.recentWorks[index],
            currentProjectIndex: index,
          ),
        ),
      ),
      desktop: SizedBox(
        height: subHeight * Data.recentWorks.length + extraHeight,
        child: Stack(
          children: List.generate(
            Data.recentWorks.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(top: subHeight * index),
                child: ProjectItemLg(
                  projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
                  imageUrl: Data.recentWorks[index].image,
                  projectItemHeight: projectItemHeight,
                  subHeight: subHeight,
                  backgroundColor: AppColors.accentColor2.withOpacity(0.35),
                  title: Data.recentWorks[index].title,
                  subtitle: Data.recentWorks[index].category,
                  containerColor: Data.recentWorks[index].primaryColor,
                  onTap: () => Functions.navigateToProject(
                    context: context,
                    dataSource: Data.recentWorks,
                    currentProject: Data.recentWorks[index],
                    currentProjectIndex: index,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
