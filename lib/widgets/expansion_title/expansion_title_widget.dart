import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';

class ExpansionTileWidget extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool enabled;
  final EdgeInsets childrenPadding;

  const ExpansionTileWidget({
    super.key,
    required this.title,
    required this.children,
    this.enabled = true,
    this.childrenPadding = const EdgeInsets.only(left: AppSpacing.nano),
  });

  @override
  State<ExpansionTileWidget> createState() => _ExpansionTileWidgetState();
}

class _ExpansionTileWidgetState extends State<ExpansionTileWidget> {
  bool _expanded = true;

  IconData get _icon => _expanded ? Icons.arrow_drop_down : Icons.arrow_right;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        enabled: widget.enabled,
        onExpansionChanged: (expanded) => setState(() => _expanded = expanded),
        collapsedShape: const BorderDirectional(bottom: BorderSide(color: AppColors.border)),
        shape: const BorderDirectional(bottom: BorderSide(color: AppColors.border)),
        tilePadding: const EdgeInsets.only(left: AppSpacing.micro),
        title: Text(widget.title).bodyExtraSmallMedium(),
        leading: Icon(_icon, color: AppColors.white, size: AppSpacing.xxs),
        childrenPadding: widget.childrenPadding,
        initiallyExpanded: true,
        clipBehavior: Clip.none,
        controlAffinity: ListTileControlAffinity.leading,
        children: widget.children);
  }
}
