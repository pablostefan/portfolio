import 'package:flutter/material.dart';
import 'package:portfolio/values/values.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
    this.title = """<PS>""",
    this.titleColor = AppColors.black,
    this.titleStyle,
    this.fontSize = 50,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color titleColor;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: titleStyle ??
          textTheme.headlineLarge?.copyWith(
            color: titleColor,
            fontSize: fontSize,
          ),
    );
  }
}
