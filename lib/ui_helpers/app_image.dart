enum AppImages {
  snakeGame._('images/snake_game.png'),
  backgroundBlurs._('images/background_blurs.png'),
  logo._('images/logo.png');

  const AppImages._(this.path);

  final String path;
}
