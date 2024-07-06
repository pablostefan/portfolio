import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/models/recommendation_model.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_images.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:portfolio/widgets/about_me_widget/recommendations_widget.dart';

class AboutMeWidgetDesktop extends StatelessWidget {
  const AboutMeWidgetDesktop({super.key});

  List<RecommendationModel> get _recommendation => [
        RecommendationModel(
            name: "Guilherme Nunes Bento Peres",
            position: "Product Owner - CSPO ",
            recommendation:
                "Pablo é um profissional extremamente dedicado e focado no aprendizado e melhoria contínua, que gosta de desafios em busca de uma constante evolução. Exemplar em todos os aspectos.",
            image: AppImages.gui),
        RecommendationModel(
            name: "Guilherme Nunes Bento Peres",
            position: "Product Owner - CSPO ",
            recommendation:
                "Pablo é um profissional extremamente dedicado e focado no aprendizado e melhoria contínua, que gosta de desafios em busca de uma constante evolução. Exemplar em todos os aspectos.",
            image: AppImages.gui),
        RecommendationModel(
            name: "Guilherme Nunes Bento Peres",
            position: "Product Owner - CSPO ",
            recommendation:
                "Pablo é um profissional extremamente dedicado e focado no aprendizado e melhoria contínua, que gosta de desafios em busca de uma constante evolução. Exemplar em todos os aspectos.",
            image: AppImages.gui),
      ];

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          flex: 5,
          child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
              child: AutoSizeText.rich(TextSpan(children: [
                _CodeTextSpan(text: "1    /**\n"),
                _CodeTextSpan(text: "2    * "),
                _CodeTextSpan(color: AppColors.accentThree, text: AppLocale.aboutMeTitle.getString(context)),
                _CodeTextSpan(text: " *\n"),
                _CodeTextSpan(text: AppLocale.aboutMeText.getString(context)),
              ])))),
      const VerticalDivider(color: AppColors.border),
      Expanded(
          flex: 3,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                        child: Text(AppLocale.recommendations.getString(context))
                            .bodySmallRegular()
                            .color(AppColors.secondaryOne)),
                    RecommendationsWidget(recommendation: _recommendation[0]),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.xxs),
                        child: Divider(color: AppColors.border, height: .5)),
                    RecommendationsWidget(recommendation: _recommendation[1]),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.xxs),
                        child: Divider(color: AppColors.border, height: .5)),
                    RecommendationsWidget(recommendation: _recommendation[2]),
                  ])))
    ]);
  }
}

class _CodeTextSpan extends TextSpan {
  final Color color;

  _CodeTextSpan({this.color = AppColors.secondaryOne, super.text})
      : super(
            style: const Text("")
                .bodyExtraSmallRegular(style: const TextStyle(height: AppSpacing.atto))
                .color(color)
                .style);
}
