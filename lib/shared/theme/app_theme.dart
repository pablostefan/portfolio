import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/shared/values/values.dart';

class AppTheme {
  static const _lightFillColor = Colors.black;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);

  static ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: AppColors.white),
      canvasColor: colorScheme.background,
      appBarTheme: AppBarTheme(color: AppColors.primaryColor),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.black,
        selectionColor: AppColors.textSelectionColor,
        selectionHandleColor: AppColors.primaryColor,
      ),
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,

      // accentColor: colorScheme.primary,
      focusColor: AppColors.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.primaryColor,
    primaryContainer: AppColors.primaryColor,
    // primaryVariant: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    secondaryContainer: AppColors.black,
    // secondaryVariant: AppColors.black,
    background: AppColors.primaryColor,
    surface: AppColors.primaryColor,
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_60,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_48,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_34,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_20,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: TextStyle(
      fontFamily: StringConst.VISUELT_PRO,
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    bodySmall: GoogleFonts.roboto(
      fontSize: Sizes.TEXT_SIZE_14,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
  );
}
