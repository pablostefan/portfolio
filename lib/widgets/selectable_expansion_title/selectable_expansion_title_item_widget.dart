import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/models/about_me_selected_page_model.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';

class SelectableExpansionTitleItemWidget extends StatefulWidget {
  final AppVectors icon;
  final String title;
  final ValueChanged<AboutMePageModel> onTap;
  final Color? selectedIconColor;
  final AboutMePageModel page;
  final AboutMePageModel selectedPage;

  const SelectableExpansionTitleItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.page,
    required this.selectedPage,
    this.selectedIconColor,
  });

  @override
  State<SelectableExpansionTitleItemWidget> createState() => _SelectableExpansionTitleItemWidgetState();
}

class _SelectableExpansionTitleItemWidgetState extends State<SelectableExpansionTitleItemWidget> {
  bool _hovering = false;

  double get _scale => _hovering ? 1.02 : 1.0;

  bool get _selected => widget.page == widget.selectedPage;

  Color get _iconColor {
    return _selected ? (widget.selectedIconColor ?? AppColors.secondaryOne) : AppColors.secondaryOne;
  }

  Color get _textColor => _selected ? AppColors.white : AppColors.secondaryOne;

  void _mouseEnter(bool hover) => setState(() => _hovering = hover);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap(widget.page),
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
                          height: AppSpacing.xxs,
                          width: AppSpacing.xxs,
                          colorFilter: ColorFilter.mode(_iconColor, BlendMode.srcIn)),
                      AppSpacing.gapNano,
                      Text(widget.title).bodyExtraSmallRegular().color(_textColor)
                    ])))));
  }
}
