import 'package:flutter/material.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/widgets/works/workr_card.dart';

class WorksDesktopWidget extends StatelessWidget {
  const WorksDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: AppSpacing.xxxs,
        runSpacing: AppSpacing.xxxs,
        children: WorkModel.myWorks.map((work) => WorkCard(work: work)).toList());
  }
}
