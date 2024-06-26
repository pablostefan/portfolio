mixin AppLocale {
  static const String shortName = 'shortName';
  static const String myName = 'myName';
  static const String hello = 'hello';
  static const String aboutMe = 'aboutMe';
  static const String projects = 'projects';
  static const String contactMe = 'contactMe';
  static const String hi = 'hi';
  static const String frontEnd = 'frontEnd';
  static const String completeGame = 'completeGame';
  static const String seeGitHub = 'seeGitHub';
  static const String findMe = 'findMe';
  static const String constString = 'const';
  static const String githubLink = 'githubLink';
  static const String contacts = 'contacts';
  static const String findMeAlso = 'findMeAlso';
  static const String name = 'name';
  static const String email = 'email';
  static const String message = 'message';
  static const String submitMessage = 'submitMessage';

  static const Map<String, dynamic> en = {
    shortName: 'pablo-stefan',
    myName: 'Pablo Stefan',
    hello: '_hello',
    aboutMe: "_about-me",
    projects: "_projects",
    contactMe: "_contact-me",
    hi: 'Hi all. I am',
    frontEnd: '> Front-end and Mobile developer',
    completeGame: '// Complete the game to continue',
    seeGitHub: '// You can also see my github page',
    findMe: 'find me on',
    constString: 'const',
    githubLink: 'githubLink',
    contacts: 'contacts',
    findMeAlso: 'find-me-also-in',
    name: '_name:',
    email: '_email:',
    message: '_message:',
    submitMessage: 'submit-message'
  };

  static const Map<String, dynamic> pt = {
    shortName: 'pablo-stefan',
    myName: 'Pablo Stefan',
    hello: '_olá',
    aboutMe: "_sobre-mim",
    projects: "_projetos",
    contactMe: "_contate-me",
    hi: 'Olá! Eu sou',
    frontEnd: '> Desenvolvedor Front-end e Mobile',
    completeGame: '// Complete o jogo para continuar',
    seeGitHub: '// Voce tambem pode ver minha página do github',
    findMe: 'me encontre no',
    constString: 'const',
    githubLink: 'githubLink',
    contacts: 'contatos',
    findMeAlso: 'me-encontre-tambem-em',
    name: '_nome:',
    email: '_email:',
    message: '_mensagem:',
    submitMessage: 'enviar-mensagem'
  };
}

extension AppLocaleExtension on AppLocale {
  static String get name => AppLocale.myName;

  static String get shortName => AppLocale.shortName;

  static String get hello => AppLocale.hello;

  static String get aboutMe => AppLocale.aboutMe;

  static String get projects => AppLocale.projects;

  static String get contactMe => AppLocale.contactMe;
}
