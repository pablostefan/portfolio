import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';

class ExpansionTitleItemWidget extends StatefulWidget {
  final AppVectors icon;
  final String title;
  final VoidCallback onTap;

  const ExpansionTitleItemWidget({super.key, required this.icon, required this.title, required this.onTap});

  @override
  State<ExpansionTitleItemWidget> createState() => _ExpansionTitleItemWidgetState();
}

class _ExpansionTitleItemWidgetState extends State<ExpansionTitleItemWidget> {
  bool _hovering = false;

  double get _scale => _hovering ? 1.02 : 1.0;

  void _mouseEnter(bool hover) => setState(() => _hovering = hover);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.xxxs, left: AppSpacing.xxs),
            child: MouseRegion(
                onEnter: (e) => _mouseEnter(true),
                onExit: (e) => _mouseEnter(false),
                child: AnimatedScale(
                    scale: _scale,
                    duration: Durations.short4,
                    child: Row(children: [
                      SvgPicture.asset(widget.icon.path,
                          height: AppSpacing.xxxs,
                          width: AppSpacing.xxxs,
                          colorFilter: const ColorFilter.mode(AppColors.secondaryOne, BlendMode.srcIn)),
                      AppSpacing.gapNano,
                      Text(widget.title).bodyExtraSmallRegular().color(AppColors.secondaryOne)
                    ])))));
  }
}
