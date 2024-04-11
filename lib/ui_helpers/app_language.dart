import 'package:portfolio/ui_helpers/app_vectors.dart';

enum Languages {
  ptBr._(name: 'Pt-Br', flag: AppVectors.br, languageCode: 'pt'),
  enUs._(name: 'En-Us', flag: AppVectors.us, languageCode: 'en');

  const Languages._({required this.name, required this.flag, required this.languageCode});

  final String name;
  final AppVectors flag;
  final String languageCode;
}
