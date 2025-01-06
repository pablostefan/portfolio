import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/routing/routes.dart';
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
    TextTheme textTheme = Theme.of(context).textTheme;

    return AdaptiveBuilderWidget(
      tabletNormal: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: Data.recentWorks.length,
        separatorBuilder: (_, __) => const CustomSpacer(heightFactor: .17),
        itemBuilder: (_, index) => ProjectItemTablet(
          projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
          imageHeight: context.responsive(context.assignHeight(0.1), context.assignHeight(0.3)),
          titleStyle: textTheme.labelLarge?.copyWith(color: AppColors.black, fontSize: context.responsive(20, 26)),
          imageUrl: Data.recentWorks[index].image,
          title: Data.recentWorks[index].title,
          subtitle: Data.recentWorks[index].category,
          containerColor: Data.recentWorks[index].primaryColor,
          onTap: () => context.go(Routes.projectDetailRoute(Data.recentWorks[index].title)),
        ),
      ),
      desktop: SizedBox(
        height: subHeight * Data.recentWorks.length,
        child: Stack(
          children: List.generate(
            Data.recentWorks.length,
            (index) {
              return Padding(
                padding: EdgeInsets.only(top: subHeight * index),
                child: ProjectItemDesktop(
                  projectNumber: index + 1 > 9 ? "${index + 1}" : "0${index + 1}",
                  imageUrl: Data.recentWorks[index].image,
                  projectItemHeight: projectItemHeight,
                  subHeight: subHeight,
                  backgroundColor: AppColors.accentColor2.withOpacity(0.35),
                  title: Data.recentWorks[index].title,
                  subtitle: Data.recentWorks[index].category,
                  containerColor: Data.recentWorks[index].primaryColor,
                  onTap: () => context.go(Routes.projectDetailRoute(Data.recentWorks[index].title)),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
