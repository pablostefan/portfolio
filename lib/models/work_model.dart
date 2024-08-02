import 'package:flutter/material.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/ui_helpers/app_images.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';

enum CodeType {
  flutter,
  android,
  react,
  swift;

  AppVectors get icon {
    switch (this) {
      case CodeType.flutter:
        return AppVectors.flutter;
      case CodeType.android:
        return AppVectors.android;
      case CodeType.swift:
        return AppVectors.swift;
      case CodeType.react:
        return AppVectors.react;
    }
  }
}

class WorkModel {
  final DateTime startDate;
  final DateTime endDate;
  final String name;
  final AppImages image;
  final AppImages background;
  final Color shadowColor;
  final List<CodeType> codeType;
  final String description;
  final bool isCurrent;
  final String url;

  WorkModel({
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.codeType,
    required this.image,
    required this.background,
    required this.shadowColor,
    required this.description,
    this.isCurrent = false,
    this.url = "",
  });

  static List<WorkModel> get myWorks {
    return [
      WorkModel(
          shadowColor: Colors.white.withOpacity(.4),
          startDate: DateTime(2022, 3, 1),
          endDate: DateTime(2023, 1, 1),
          url: "https://krykto.com",
          image: AppImages.krykto,
          background: AppImages.kryktoFirstBg,
          name: AppLocale.juniorMobileDeveloper,
          description: AppLocale.kryktoJuniorDescription,
          codeType: [CodeType.flutter]),
      WorkModel(
          shadowColor: Colors.white.withOpacity(.4),
          startDate: DateTime(2023, 1, 1),
          endDate: DateTime(2024, 4, 1),
          image: AppImages.krykto,
          url: "https://krykto.com",
          background: AppImages.kryktoSecondBg,
          name: AppLocale.mobileDeveloper,
          description: AppLocale.kryktoDescription,
          codeType: [CodeType.android]),
      WorkModel(
          shadowColor: Colors.black.withOpacity(.4),
          startDate: DateTime(2024, 4, 1),
          endDate: DateTime.now(),
          image: AppImages.fiibo,
          background: AppImages.fiiboBg,
          name: AppLocale.mobileDeveloper,
          url: "https://fiibo.com.br",
          description: AppLocale.fiiboDescription,
          isCurrent: true,
          codeType: [CodeType.swift]),
    ];
  }
}
