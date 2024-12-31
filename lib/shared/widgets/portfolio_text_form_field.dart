import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/shared/widgets/empty.dart';
import 'package:portfolio/values/values.dart';

class PortfolioTextFormField extends StatelessWidget {
  const PortfolioTextFormField({
    super.key,
    this.title = '',
    this.titleStyle,
    this.hasTitle = true,
    this.textStyle,
    this.hintTextStyle,
    this.labelStyle,
    this.contentPadding,
    this.border = Borders.primaryInputBorder,
    this.focusedBorder = Borders.focusedBorder,
    this.enabledBorder = Borders.enabledBorder,
    this.hintText,
    this.labelText,
    this.obscured = false,
    this.textInputType,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.fillColor = AppColors.fillColor,
    this.filled = false,
    this.maxLines = 1,
    this.controller,
  });

  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelStyle;
  final TextStyle? titleStyle;
  final String title;
  final String? hintText;
  final String? labelText;
  final bool obscured;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder border;
  final InputBorder enabledBorder;
  final InputBorder focusedBorder;
  final EdgeInsetsGeometry? contentPadding;
  final Color fillColor;
  final bool filled;
  final bool hasTitle;
  final int? maxLines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        hasTitle ? Text(title, style: titleStyle) : Empty(),
        TextFormField(
          style: textStyle ??
              textTheme.bodyLarge?.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
          controller: controller,
          keyboardType: textInputType,
          onChanged: onChanged,
          maxLines: maxLines,
          validator: validator,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: filled,
            contentPadding: contentPadding,
            labelText: labelText,
            labelStyle: labelStyle,
            border: border,
            enabledBorder: enabledBorder,
            focusedBorder: focusedBorder,
            hintText: hintText,
            hintStyle: hintTextStyle ??
                textTheme.bodyLarge?.copyWith(
                  color: AppColors.grey600,
                ),
          ),
          obscureText: obscured,
        ),
      ],
    );
  }
}
