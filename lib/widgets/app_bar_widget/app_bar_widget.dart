import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/widgets/app_bar_widget/models/app_bar_button.dart';
import 'package:portfolio/widgets/app_bar_widget/views/app_bar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AppBarWidget extends PreferredSize {
  final ValueChanged<AppBarButton> onTap;
  final AppBarButton selected;

  AppBarWidget({super.key, required this.onTap, required this.selected})
      : super(
            preferredSize: const Size.fromHeight(AppSpacing.md),
            child: ScreenTypeLayout.builder(
                mobile: (_) => AppBarDesktop(onTap: onTap, selected: selected),
                tablet: (_) => AppBarDesktop(onTap: onTap, selected: selected),
                desktop: (_) => AppBarDesktop(onTap: onTap, selected: selected)));
}
