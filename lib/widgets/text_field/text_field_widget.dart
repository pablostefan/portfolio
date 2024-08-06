import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry padding;
  final double? height;
  final int? maxLines;
  final bool expands;

  const TextFieldWidget({
    super.key,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.height,
    this.maxLines = 1,
    this.expands = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        padding: padding,
        child: TextField(
            maxLines: maxLines,
            controller: controller,
            expands: expands,
            textAlignVertical: TextAlignVertical.top,
            style: const Text("").bodyExtraSmallRegular().style,
            cursorColor: AppColors.secondaryOne,
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.primaryThree,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.border),
                    borderRadius: BorderRadius.circular(AppSpacing.nano)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.secondaryOne, width: AppSpacing.atto),
                    borderRadius: BorderRadius.circular(AppSpacing.nano)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.border),
                    borderRadius: BorderRadius.circular(AppSpacing.nano)))));
  }
}
