import 'package:portfolio/ui_helpers/app_images.dart';

class RecommendationModel {
  final String name;
  final String position;
  final String recommendation;
  final AppImages image;

  RecommendationModel({
    required this.name,
    required this.position,
    required this.recommendation,
    required this.image,
  });

  static List<RecommendationModel> get recommendations => [
        RecommendationModel(
            name: "Guilherme Nunes Bento Peres",
            position: "Product Owner - CSPO ",
            recommendation:
                "Pablo é um profissional extremamente dedicado e focado no aprendizado e melhoria contínua, que gosta de desafios em busca de uma constante evolução. Exemplar em todos os aspectos.",
            image: AppImages.gui),
        RecommendationModel(
            name: "Guilherme Nunes Bento Peres",
            position: "Product Owner - CSPO ",
            recommendation:
                "Pablo é um profissional extremamente dedicado e focado no aprendizado e melhoria contínua, que gosta de desafios em busca de uma constante evolução. Exemplar em todos os aspectos.",
            image: AppImages.gui),
        RecommendationModel(
            name: "Guilherme Nunes Bento Peres",
            position: "Product Owner - CSPO ",
            recommendation:
                "Pablo é um profissional extremamente dedicado e focado no aprendizado e melhoria contínua, que gosta de desafios em busca de uma constante evolução. Exemplar em todos os aspectos.",
            image: AppImages.gui),
      ];
}
