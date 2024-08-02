import 'package:flutter/material.dart';
import 'package:portfolio/extensions/date_extensions.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';

class WorkCard extends StatelessWidget {
  final WorkModel work;

  const WorkCard({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.border)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(alignment: Alignment.center, children: [
            ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                child:
                    Image.asset(work.background.path, opacity: const AlwaysStoppedAnimation(.8), fit: BoxFit.fitWidth)),
            DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [BoxShadow(color: work.shadowColor.withOpacity(.4), blurRadius: 7, spreadRadius: 4)]),
                child: Image.asset(work.image.path, width: 90, fit: BoxFit.fitWidth)),
          ]),
          Padding(
              padding: const EdgeInsets.all(8),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(work.name).bodySmallRegular().color(AppColors.accentOne),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.nano),
                    child: Text("${work.startDate.workDate} - ${work.endDate.workDate}")
                        .bodyExtraSmallRegular()
                        .color(AppColors.secondaryThree)),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.nano),
                    child: Text(work.description).bodyExtraSmallRegular().color(AppColors.secondaryOne)),
              ]))
        ]));
  }
}
