import 'package:flutter/material.dart';
import 'package:portfolio/models/recommendation_model.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';

class RecommendationsWidget extends StatelessWidget {
  final RecommendationModel recommendation;

  const RecommendationsWidget({super.key, required this.recommendation});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        ClipOval(child: Image.asset(recommendation.image.path, width: AppSpacing.sm, height: AppSpacing.sm)),
        const SizedBox(width: AppSpacing.xxxs),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(recommendation.name).bodyTinyMedium().color(AppColors.secondaryTwo),
          Padding(
              padding: const EdgeInsets.only(top: AppSpacing.femto),
              child: Text(recommendation.position).bodyTinyRegular().color(AppColors.secondaryThree)),
        ])
      ]),
      Container(
          margin: const EdgeInsets.only(top: AppSpacing.xxxs),
          padding: const EdgeInsets.all(AppSpacing.micro),
          decoration: BoxDecoration(
              color: AppColors.primaryThree,
              borderRadius: BorderRadius.circular(AppSpacing.nano),
              border: Border.all(color: AppColors.border)),
          child: Text(recommendation.recommendation).bodyTinyRegular().color(AppColors.secondaryOne))
    ]);
  }
}
