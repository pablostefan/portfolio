import 'package:flutter/cupertino.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_language.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';

class BottomNavBarDesktop extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BottomNavBarDesktop({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: AppSpacing.md,
        decoration: BoxDecoration(border: Border.all(color: AppColors.border)),
        child: Row(children: [
          Container(
              width: AppSpacing.extraGiant - 1,
              decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
              padding: const EdgeInsets.fromLTRB(AppSpacing.xs, AppSpacing.micro, AppSpacing.none, AppSpacing.micro),
              child: Text(AppLocale.findMe.getString(context)).bodySmallRegular().color(AppColors.secondaryOne)),
          Container(
              decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.micro),
              child: SvgPicture.asset(AppVectors.linkedin.path,
                  width: AppSpacing.xxs,
                  height: AppSpacing.xxs,
                  colorFilter: const ColorFilter.mode(AppColors.secondaryOne, BlendMode.srcIn))),
          Container(
              decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.micro),
              child: SvgPicture.asset(AppVectors.github.path,
                  width: AppSpacing.xxs,
                  height: AppSpacing.xxs,
                  colorFilter: const ColorFilter.mode(AppColors.secondaryOne, BlendMode.srcIn))),
          Container(
              decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.micro),
              child: SvgPicture.asset(AppVectors.whatsapp.path,
                  width: AppSpacing.xxs,
                  height: AppSpacing.xxs,
                  colorFilter: const ColorFilter.mode(AppColors.secondaryOne, BlendMode.srcIn))),
          Container(
              decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.micro),
              child: SvgPicture.asset(AppVectors.medium.path,
                  width: AppSpacing.xxs,
                  height: AppSpacing.xxs,
                  colorFilter: const ColorFilter.mode(AppColors.secondaryOne, BlendMode.srcIn))),
          const Spacer(),
          Container(
              decoration: const BoxDecoration(border: Border(left: BorderSide(color: AppColors.border))),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.micro),
              child: Row(children: [
                Opacity(
                    opacity: value ? .5 : 1,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSpacing.atto),
                        child: SvgPicture.asset(Languages.ptBr.flag.path,
                            width: AppSpacing.xxxs, height: AppSpacing.xxxs))),
                Container(
                    width: AppSpacing.md,
                    padding: const EdgeInsets.all(AppSpacing.pico),
                    child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: CupertinoSwitch(
                            trackColor: const Color.fromRGBO(1, 146, 63, 1),
                            activeColor: const Color.fromRGBO(180, 4, 9, 1),
                            value: value,
                            onChanged: onChanged))),
                Opacity(
                    opacity: value ? 1 : .5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSpacing.atto),
                        child: SvgPicture.asset(Languages.enUs.flag.path,
                            width: AppSpacing.xxxs, height: AppSpacing.xxxs))),
              ]))
        ]));
  }
}
