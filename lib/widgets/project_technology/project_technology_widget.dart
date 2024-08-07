import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/widgets/project_technology/project_technology_model.dart';

class ProjectTechnologyWidget extends StatelessWidget {
  final ProjectTechnology projectTechnology;
  final ValueChanged<ProjectTechnology> onTap;

  const ProjectTechnologyWidget({super.key, required this.projectTechnology, required this.onTap});

  double get _iconOpacity => projectTechnology.isSelected ? 1 : .4;

  Color get _textColor => projectTechnology.isSelected ? AppColors.white : AppColors.secondaryOne;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(projectTechnology),
        child: Row(children: [
          Checkbox(
              side: const BorderSide(color: AppColors.secondaryOne),
              value: projectTechnology.isSelected,
              onChanged: (_) => onTap(projectTechnology),
              activeColor: AppColors.secondaryOne),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.nano),
              child: SvgPicture.asset(projectTechnology.icon.path,
                  colorFilter: ColorFilter.mode(AppColors.secondaryOne.withOpacity(_iconOpacity), BlendMode.srcIn),
                  height: AppSpacing.xxs,
                  width: AppSpacing.xxs)),
          Text(projectTechnology.name).bodyExtraSmallRegular().color(_textColor)
        ]));
  }
}
