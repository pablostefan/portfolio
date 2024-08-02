import 'package:flutter/material.dart';
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

  WorkModel({
    required this.startDate,
    required this.endDate,
    required this.name,
    required this.codeType,
    required this.image,
    required this.background,
    required this.shadowColor,
    required this.description,
  });

  static List<WorkModel> get myWorks {
    return [
      WorkModel(
          shadowColor: Colors.white.withOpacity(.4),
          startDate: DateTime(2021, 1, 1),
          endDate: DateTime(2021, 1, 31),
          image: AppImages.krykto,
          background: AppImages.kryktoFirstBg,
          name: 'Junior Mobile Developer',
          description: "Desenvolvedor de aplicativos, responsável por criar e manter apps de criptomoedas.",
          codeType: [CodeType.flutter]),
      WorkModel(
          shadowColor: Colors.white.withOpacity(.4),
          startDate: DateTime(2021, 2, 1),
          endDate: DateTime(2021, 2, 28),
          image: AppImages.krykto,
          background: AppImages.kryktoSecondBg,
          name: 'Mobile Developer',
          description: "Responsável pelo setor de desenvolvimento de aplicativos na software house Krykto.",
          codeType: [CodeType.android]),
      WorkModel(
          shadowColor: Colors.black.withOpacity(.4),
          startDate: DateTime(2021, 3, 1),
          endDate: DateTime(2021, 3, 31),
          image: AppImages.fiibo,
          background: AppImages.fiiboBg,
          name: 'Mobile Developer',
          description: "Na Fiibo, sou responsável pela manutenção e desenvolvimento contínuo de um aplicativo de saúde",
          codeType: [CodeType.swift]),
    ];
  }
}
