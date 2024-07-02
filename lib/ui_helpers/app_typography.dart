import 'package:flutter/material.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';

enum FontFamily {
  firaCode._("FiraCode");

  const FontFamily._(this.name);

  final String name;
}

abstract class TypographyLineHeight {
  static const double body = 1.2;
  static const double title = 1.4;
}

abstract class TypographyFontWeight {
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

abstract class TypographyFontSize {
  static const double extraLarge = 62;
  static const double large = 32;
  static const double body = 24;
  static const double label = 20;
  static const double small = 18;
  static const double extraSmall = 14;
}

extension TypographyExtension on Text {
  Text titleExtraLargeMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.extraLarge,
        fontWeight: TypographyFontWeight.medium,
        height: TypographyLineHeight.title,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text titleExtraLargeSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.extraLarge,
        fontWeight: TypographyFontWeight.semiBold,
        height: TypographyLineHeight.title,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLabelSemiBold({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.label,
        fontWeight: TypographyFontWeight.semiBold,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.small,
        fontWeight: TypographyFontWeight.regular,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodySmallMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.small,
        fontWeight: TypographyFontWeight.medium,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLabelRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.label,
        fontWeight: TypographyFontWeight.regular,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyLabelMedium({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.label,
        fontWeight: TypographyFontWeight.medium,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text bodyExtraSmallRegular({TextStyle? style}) {
    TextStyle defaultStyle = _getTextStyle(
        fontSize: TypographyFontSize.extraSmall,
        fontWeight: TypographyFontWeight.regular,
        height: TypographyLineHeight.body,
        mergeStyle: style);

    return _getTextTypography(text: this, textStyle: defaultStyle);
  }

  Text _getTextTypography({required Text text, required TextStyle textStyle}) {
    return Text(text.data!,
        style: textStyle,
        key: text.key,
        strutStyle: text.strutStyle,
        textAlign: text.textAlign,
        textDirection: text.textDirection,
        locale: text.locale,
        softWrap: text.softWrap,
        overflow: text.overflow,
        maxLines: text.maxLines,
        semanticsLabel: text.semanticsLabel,
        textWidthBasis: text.textWidthBasis,
        textHeightBehavior: text.textHeightBehavior);
  }

  TextStyle _getTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
    double? letterSpacing,
    required TextStyle? mergeStyle,
  }) {
    return TextStyle(
            fontSize: fontSize,
            fontStyle: FontStyle.normal,
            fontFamily: FontFamily.firaCode.name,
            height: height,
            color: AppColors.white,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight)
        .merge(mergeStyle);
  }

  Text color(Color color) {
    return Text(data!,
        style: style!.copyWith(color: color),
        key: key,
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior);
  }

  TextSpan toTextSpan({List<TextSpan>? children}) => TextSpan(text: data, style: style, children: children ??= []);
}
