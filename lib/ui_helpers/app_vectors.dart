enum AppVectors {
  linkedin._('vectors/linkedin.svg'),
  github._('vectors/github.svg'),
  medium._('vectors/medium.svg'),
  whatsapp._('vectors/whatsapp.svg'),
  mail._('vectors/mail.svg'),
  phone._('vectors/phone.svg'),
  us._('vectors/us.svg'),
  br._('vectors/br.svg');

  const AppVectors._(this.path);

  final String path;
}
