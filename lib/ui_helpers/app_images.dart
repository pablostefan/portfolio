enum AppImages {
  snakeGame._('images/snake_game.png'),
  backgroundBlurs._('images/background_blurs.png'),
  gui._('images/gui.png'),
  work._('images/work.png'),
  logo._('images/logo.png'),
  krykto._('images/krykto.png'),
  kryktoFirstBg._('images/krykto_first_bg.png'),
  kryktoSecondBg._('images/krykto_second_bg.png'),
  fiibo._('images/fiibo.png'),
  fiiboBg._('images/fiibo_bg.png');

  const AppImages._(this.path);

  final String path;
}
