import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/models/recommendation_model.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/widgets/about_me/recommendations_widget.dart';

class AboutMeDesktopWidget extends StatelessWidget {
  const AboutMeDesktopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro),
        child: Row(children: [
          Expanded(
              flex: 4,
              child: Container(
                  alignment: Alignment.center,
                  child: AutoSizeText.rich(
                      TextSpan(children: [
                        _CodeTextSpan(text: "1    /**\n"),
                        _CodeTextSpan(text: "2    * "),
                        _CodeTextSpan(color: AppColors.accentThree, text: AppLocale.aboutMeTitle.getString(context)),
                        _CodeTextSpan(text: " *\n"),
                        _CodeTextSpan(text: AppLocale.aboutMeText.getString(context)),
                      ]),
                      minFontSize: 8))),
          const VerticalDivider(color: AppColors.border),
          Expanded(
              flex: 3,
              child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.micro, vertical: AppSpacing.md),
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.xxs),
                        child: Text(AppLocale.recommendations.getString(context))
                            .bodySmallRegular()
                            .color(AppColors.secondaryOne)),
                    RecommendationsWidget(recommendation: RecommendationModel.recommendations[0]),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.xxs),
                        child: Divider(color: AppColors.border, height: .5)),
                    RecommendationsWidget(recommendation: RecommendationModel.recommendations[1]),
                    const Padding(
                        padding: EdgeInsets.symmetric(vertical: AppSpacing.xxs),
                        child: Divider(color: AppColors.border, height: .5)),
                    RecommendationsWidget(recommendation: RecommendationModel.recommendations[2]),
                  ]))
        ]));
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
