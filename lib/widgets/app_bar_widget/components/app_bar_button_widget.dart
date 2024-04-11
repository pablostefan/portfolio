import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/widgets/app_bar_widget/models/app_bar_button.dart';

class AppBarButtonWidget extends StatefulWidget {
  final AppBarButton model;
  final ValueChanged<AppBarButton> onTap;
  final AppBarButton selected;
  final Border border;
  final EdgeInsetsGeometry padding;
  final double? width;

  const AppBarButtonWidget({
    super.key,
    required this.model,
    required this.onTap,
    required this.selected,
    this.width,
    this.padding = const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.micro),
    this.border = const Border(
        top: BorderSide(color: AppColors.border),
        bottom: BorderSide(color: AppColors.border),
        right: BorderSide(color: AppColors.border)),
  });

  @override
  State<AppBarButtonWidget> createState() => _AppBarButtonWidgetState();
}

class _AppBarButtonWidgetState extends State<AppBarButtonWidget> {
  bool get _isSelected => widget.model == widget.selected;

  Color get _textColor => _isSelected ? AppColors.white : AppColors.secondaryOne;

  Border get _selected => Border(
      top: widget.border.top,
      right: widget.border.right,
      left: widget.border.left,
      bottom: const BorderSide(color: AppColors.accentOne));

  Border get _border => _isSelected ? _selected : widget.border;

  double get _scale => _hovering ? 1.1 : 1.0;

  bool _hovering = false;

  void _mouseEnter(bool hover) => setState(() => _hovering = hover);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onTap(widget.model),
        child: Container(
            width: widget.width,
            padding: widget.padding,
            height: AppSpacing.lg,
            decoration: BoxDecoration(border: _border),
            child: MouseRegion(
                onEnter: (e) => _mouseEnter(true),
                onExit: (e) => _mouseEnter(false),
                child: AnimatedScale(
                    scale: _scale,
                    duration: Durations.short4,
                    child: Text(widget.model.getTitle(context)).bodySmallRegular().color(_textColor)))));
  }
}
