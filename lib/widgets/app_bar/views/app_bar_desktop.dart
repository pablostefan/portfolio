import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_images.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/widgets/app_bar/components/app_bar_button_widget.dart';
import 'package:portfolio/widgets/app_bar/models/app_bar_button.dart';

class AppBarDesktop extends PreferredSize {
  final ValueChanged<AppBarButton> onTap;
  final AppBarButton selected;

  AppBarDesktop({super.key, required this.onTap, required this.selected})
      : super(
            preferredSize: const Size.fromHeight(AppSpacing.md),
            child: Row(children: [
              AppBarButtonWidget(
                  width: AppSpacing.extraGiant,
                  border: Border.all(color: AppColors.border),
                  model: AppBarButton.name,
                  onTap: onTap,
                  selected: selected),
              AppBarButtonWidget(model: AppBarButton.hello, onTap: onTap, selected: selected),
              AppBarButtonWidget(model: AppBarButton.about, onTap: onTap, selected: selected),
              AppBarButtonWidget(model: AppBarButton.projects, onTap: onTap, selected: selected),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.pico),
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.border))),
                      child: Image.asset(AppImages.logo.path, height: AppSpacing.md, fit: BoxFit.fitHeight))),
              AppBarButtonWidget(
                  border: Border.all(color: AppColors.border),
                  model: AppBarButton.contact,
                  onTap: onTap,
                  selected: selected)
            ]));
}
