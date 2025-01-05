import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static void launchUrl(String? url) async {
    if (url?.isNotEmpty ?? false) await launch(url!);
  }

  static Size textSize({
    required String text,
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }

  static void showSnackBar({
    required BuildContext context,
    required String message,
    Color backgroundColor = AppColors.grey,
  }) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium?.copyWith(fontSize: Sizes.TEXT_SIZE_16, color: AppColors.black),
        ),
        duration: Animations.emailSnackBarDuration,
      ),
    );
  }
}
