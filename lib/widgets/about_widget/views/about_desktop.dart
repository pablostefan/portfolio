import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_links.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/ui_helpers/ui_helpers.dart';

class AboutDesktop extends StatelessWidget {
  final VoidCallback openGithub;

  const AboutDesktop({super.key, required this.openGithub});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: UiHelper.halfScreenWidth(context),
        alignment: Alignment.centerRight,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocale.hi.getString(context)).bodySmallRegular(),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.femto),
                  child: Text(AppLocale.myName.getString(context)).titleExtraLargeMedium()),
              Text(AppLocale.frontEnd.getString(context)).bodySmallRegular().color(AppColors.secondaryThree),
              AppSpacing.gapXxl,
              Text(AppLocale.completeGame.getString(context)).bodySmallRegular().color(AppColors.secondaryOne),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.nano),
                  child: Text(AppLocale.seeGitHub.getString(context)).bodySmallRegular().color(AppColors.secondaryOne)),
              GestureDetector(
                  onTap: openGithub,
                  child: RichText(
                      text: TextSpan(style: const Text("").bodySmallRegular().style, children: [
                    Text(AppLocale.constString.getString(context))
                        .bodySmallRegular()
                        .color(AppColors.secondaryThree)
                        .toTextSpan(),
                    const TextSpan(text: " "),
                    Text(AppLocale.githubLink.getString(context))
                        .bodySmallRegular()
                        .color(AppColors.accentTwo)
                        .toTextSpan(),
                    const TextSpan(text: " = "),
                    const Text(AppLinks.github).bodySmallRegular().color(AppColors.accentThree).toTextSpan(),
                  ])))
            ]));
  }
}
