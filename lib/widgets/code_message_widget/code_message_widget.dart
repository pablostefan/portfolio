import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';

class CodeMessageWidget extends StatelessWidget {
  final String name;
  final String email;
  final String message;

  const CodeMessageWidget({super.key, required this.name, required this.email, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppSpacing.micro),
        decoration: BoxDecoration(
            color: AppColors.primaryThree,
            borderRadius: BorderRadius.circular(AppSpacing.nano),
            border: Border.all(color: AppColors.border, width: 1)),
        child: RichText(
            text: TextSpan(children: [
          _CodeTextSpan(text: "1    "),
          _CodeTextSpan(color: AppColors.accentFour, text: "const "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "button "),
          _CodeTextSpan(color: AppColors.accentFour, text: "= "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "document.querySelector"),
          _CodeTextSpan(text: "("),
          _CodeTextSpan(color: AppColors.accentOne, text: "'#sendBtn'"),
          _CodeTextSpan(text: ");\n"),
          _CodeTextSpan(text: "2\n"),
          _CodeTextSpan(text: "3    "),
          _CodeTextSpan(color: AppColors.accentFour, text: "const "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "message "),
          _CodeTextSpan(color: AppColors.accentFour, text: "= "),
          _CodeTextSpan(text: "{\n"),
          _CodeTextSpan(text: "4     "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "name: "),
          _CodeTextSpan(text: "'$name',\n", color: AppColors.accentOne),
          _CodeTextSpan(text: "5     "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "email: "),
          _CodeTextSpan(text: "'$email',\n", color: AppColors.accentOne),
          _CodeTextSpan(text: "6     "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "message: "),
          _CodeTextSpan(text: "'$message'\n", color: AppColors.accentOne),
          _CodeTextSpan(text: "7     "),
          _CodeTextSpan(text: "};\n"),
          _CodeTextSpan(text: "8\n"),
          _CodeTextSpan(text: "9    "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "button.addEventListener"),
          _CodeTextSpan(text: "("),
          _CodeTextSpan(color: AppColors.accentOne, text: "'click'"),
          _CodeTextSpan(text: ", ()"),
          _CodeTextSpan(color: AppColors.accentFour, text: " => "),
          _CodeTextSpan(text: "{\n"),
          _CodeTextSpan(text: "10     "),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "form.send"),
          _CodeTextSpan(text: "("),
          _CodeTextSpan(color: AppColors.secondaryThree, text: "message"),
          _CodeTextSpan(text: ");\n"),
          _CodeTextSpan(text: "11   })"),
        ])));
  }
}

class _CodeTextSpan extends TextSpan {
  final Color color;

  _CodeTextSpan({this.color = AppColors.secondaryOne, super.text})
      : super(
            style: const Text("")
                .bodyExtraSmallRegular(style: const TextStyle(height: AppSpacing.atto))
                .color(color)
                .style);
}
