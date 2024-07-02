import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';

class AboutMeTextDesktop extends StatelessWidget {
  const AboutMeTextDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Center(
              child: RichText(
                  text: TextSpan(children: [
        _CodeTextSpan(text: "1    /**\n"),
        _CodeTextSpan(text: "2    * "),
        _CodeTextSpan(color: AppColors.accentThree, text: AppLocale.aboutMeTitle.getString(context)),
        _CodeTextSpan(text: " *\n"),
        _CodeTextSpan(text: AppLocale.aboutMeText.getString(context)),
      ])))),
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
