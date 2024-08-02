import 'package:portfolio/ui_helpers/app_vectors.dart';

enum Languages {
  ptBr._(name: 'Pt-Br', flag: AppVectors.br, languageCode: 'pt', languageName: "Português"),
  enUs._(name: 'En-Us', flag: AppVectors.us, languageCode: 'en', languageName: "English");

  const Languages._({required this.name, required this.flag, required this.languageCode, required this.languageName});

  final String name;
  final AppVectors flag;
  final String languageCode;
  final String languageName;
}
