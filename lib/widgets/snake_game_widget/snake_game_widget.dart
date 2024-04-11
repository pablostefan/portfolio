import 'package:flutter/material.dart';
import 'package:portfolio/widgets/snake_game_widget/views/snake_game_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SnakeGameWidget extends StatelessWidget {
  const SnakeGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const SnakeGameDesktop(),
        tablet: (_) => const SnakeGameDesktop(),
        desktop: (_) => const SnakeGameDesktop());
  }
}
