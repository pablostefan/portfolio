part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.url,
    required this.awardedBy,
    this.code,
  });

  final String image;
  final String url;
  final String title;
  final String awardedBy;
  final String? code;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    this.technologyUsed = "",
    this.isPublic = true,
    this.isLive = false,
    this.isWeb = false,
    this.isOnPlayStore = false,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: Routes.home),
    NavItemData(name: StringConst.ABOUT, route: Routes.about),
    NavItemData(name: StringConst.WORKS, route: Routes.work),
    NavItemData(name: StringConst.EXPERIENCE, route: Routes.experience),
    NavItemData(name: StringConst.CERTIFICATIONS, route: Routes.certifications),
    NavItemData(name: StringConst.CONTACT, route: Routes.contact),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
  ];

  static List<String> mobileTechnologies = [
    "Flutter",
    "Dart",
    "Android",
    "Kotlin",
    "Swift",
    "SwiftUI",
  ];

  static List<String> otherTechnologies = [
    "Firebase",
    "Google Cloud",
    "AWS",
    "Cognito",
    "GraphQL",
    "CI/CD",
    "GitHub Actions",
    "CodeMagic",
    "Fastlane",
    "Git",
    "Bitbucket",
    "Jira",
    "React JS",
    "Next JS",
    "React Native",
    "JavaScript",
    "Typescript",
    "HTML 5",
    "CSS 3",
    "Figma",
  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialData(
      name: StringConst.TELEGRAM,
      iconData: FontAwesomeIcons.telegram,
      url: StringConst.TELEGRAM_URL,
    ),
  ];

  static List<ProjectItemData> recentWorks = [
    ProjectItemData(
        title: StringConst.FIIBO,
        subtitle: StringConst.FIIBO,
        platform: StringConst.FIIBO_PLATFORM,
        primaryColor: AppColors.fiibo,
        image: ImagePath.FIIBO_COVER,
        coverUrl: ImagePath.FIIBO_SCREENS,
        navSelectedTitleColor: AppColors.fiibo,
        appLogoColor: AppColors.fiibo,
        category: StringConst.FIIBO_CATEGORY,
        portfolioDescription: StringConst.FIIBO_DETAIL,
        isLive: true,
        isOnPlayStore: true,
        playStoreUrl: StringConst.FIIBO_PLAY_STORE_URL,
        appStoreUrl: StringConst.FIIBO_APP_STORE_URL,
        webUrl: StringConst.FIIBO_URL,
        technologyUsed: StringConst.FLUTTER),
    ProjectItemData(
        title: StringConst.KRYKTO,
        subtitle: StringConst.KRYKTO,
        platform: StringConst.KRYKTO_PLATFORM,
        primaryColor: AppColors.krykto,
        image: ImagePath.KRYKTO_COVER,
        coverUrl: ImagePath.KRYKTO_SCREENS,
        navSelectedTitleColor: AppColors.kryktoLogo,
        appLogoColor: AppColors.kryktoLogo,
        category: StringConst.KRYKTO_CATEGORY,
        portfolioDescription: StringConst.KRYKTO_DETAIL,
        isLive: true,
        webUrl: StringConst.KRYKTO_URL,
        technologyUsed: StringConst.FLUTTER),
    ProjectItemData(
        title: StringConst.FORBES,
        subtitle: StringConst.FORBES,
        platform: StringConst.FORBES_PLATFORM,
        primaryColor: AppColors.forbes,
        image: ImagePath.FORBES_COVER,
        coverUrl: ImagePath.FORBES_SCREENS,
        navSelectedTitleColor: AppColors.forbes,
        appLogoColor: AppColors.forbes,
        category: StringConst.FORBES_CATEGORY,
        portfolioDescription: StringConst.FORBES_DETAIL,
        appStoreUrl: StringConst.FORBES_APP_STORE_URL,
        playStoreUrl: StringConst.FORBES_PLAY_STORE_URL,
        isOnPlayStore: true,
        isLive: true,
        webUrl: StringConst.FORBES_URL,
        technologyUsed: StringConst.FLUTTER),
    ProjectItemData(
        title: StringConst.FOXBIT,
        subtitle: StringConst.FOXBIT,
        platform: StringConst.FOXBIT_PLATFORM,
        primaryColor: AppColors.foxbit,
        image: ImagePath.FOXBIT_COVER,
        coverUrl: ImagePath.FOXBIT_SCREENS,
        navSelectedTitleColor: AppColors.foxbit,
        appLogoColor: AppColors.foxbit,
        category: StringConst.FOXBIT_CATEGORY,
        portfolioDescription: StringConst.FOXBIT_DETAIL,
        isOnPlayStore: true,
        isLive: true,
        webUrl: StringConst.FOXBIT_URL,
        playStoreUrl: StringConst.FOXBIT_PLAY_STORE_URL,
        appStoreUrl: StringConst.FOXBIT_APP_STORE_URL,
        technologyUsed: StringConst.FLUTTER),
    ProjectItemData(
        title: StringConst.ALPHA_CONDS,
        subtitle: StringConst.ALPHA_CONDS,
        platform: StringConst.ALPHA_CONDS_PLATFORM,
        primaryColor: AppColors.alphaConds,
        image: ImagePath.ALPHA_CONDS_COVER,
        coverUrl: ImagePath.ALPHA_CONDS_SCREENS,
        navSelectedTitleColor: AppColors.foxbit,
        appLogoColor: AppColors.alphaCondsLogo,
        category: StringConst.ALPHA_CONDS_CATEGORY,
        portfolioDescription: StringConst.ALPHA_CONDS_DETAIL,
        isOnPlayStore: true,
        isLive: true,
        webUrl: StringConst.ALPHA_CONDS_URL,
        playStoreUrl: StringConst.ALPHA_CONDS_PLAY_STORE_URL,
        appStoreUrl: StringConst.ALPHA_CONDS_APP_STORE_URL,
        technologyUsed: StringConst.FLUTTER),
    ProjectItemData(
        title: StringConst.TREINEAQUI,
        subtitle: StringConst.TREINEAQUI,
        platform: StringConst.TREINEAQUI_PLATFORM,
        primaryColor: AppColors.treineaqui,
        image: ImagePath.TREINEAQUI_COVER,
        coverUrl: ImagePath.TREINEAQUI_SCREENS,
        navSelectedTitleColor: AppColors.foxbit,
        appLogoColor: AppColors.treineaqui,
        category: StringConst.TREINEAQUI_CATEGORY,
        portfolioDescription: StringConst.TREINEAQUI_DETAIL,
        isOnPlayStore: true,
        isLive: true,
        webUrl: StringConst.TREINEAQUI_URL,
        playStoreUrl: StringConst.TREINEAQUI_PLAY_STORE_URL,
        appStoreUrl: StringConst.TREINEAQUI_APP_STORE_URL,
        technologyUsed: StringConst.FLUTTER)
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(projectName: StringConst.EMPIRICUS, gitHubUrl: StringConst.EMPIRICUS_URL),
    NoteWorthyProjectDetails(projectName: StringConst.MOVIE_APP, gitHubUrl: StringConst.MOVIE_APP_URL),
    NoteWorthyProjectDetails(projectName: StringConst.REGEX_PATTERN, gitHubUrl: StringConst.REGEX_PATTERN_URL),
    NoteWorthyProjectDetails(projectName: StringConst.ANIMATED_CHARTS, gitHubUrl: StringConst.ANIMATED_CHARTS_URL),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.XP_MOBILE,
      url: StringConst.XP_CERT_URL,
      image: ImagePath.XP_MOBILE_CERT,
      awardedBy: StringConst.XP_EDUCATION,
      code: "b38d6ca0b0e9dc65a22ddb1f51856828",
    ),
    CertificationData(
      title: StringConst.XP_ARCHITECT,
      url: StringConst.XP_CERT_URL,
      image: ImagePath.XP_ARCHITECT_CERT,
      awardedBy: StringConst.XP_EDUCATION,
      code: "181c5a7fea2f132b76fb4e79a5826dda",
    ),
    CertificationData(
      title: StringConst.FLUTTER_ANDROID,
      url: StringConst.FLUTTER_ANDROID_URL,
      image: ImagePath.FLUTTER_ANDROID_CERT,
      awardedBy: StringConst.UDEMY,
    ),
    CertificationData(
      title: StringConst.ANDROID,
      url: StringConst.ANDROID_CERT_URL,
      image: ImagePath.ANDROID_CERT,
      awardedBy: StringConst.UDEMY,
    ),
    CertificationData(
      title: StringConst.COODESH_TITLE,
      url: StringConst.COODESH_URL,
      image: ImagePath.COODESH_CERT,
      awardedBy: StringConst.COODESH,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_FIIBO,
      position: StringConst.POSITION_FIIBO,
      companyUrl: StringConst.COMPANY_FIIBO_URL,
      roles: [
        StringConst.COMPANY_FIIBO_ROLE_1,
        StringConst.COMPANY_FIIBO_ROLE_2,
        StringConst.COMPANY_FIIBO_ROLE_3,
        StringConst.COMPANY_FIIBO_ROLE_4,
        StringConst.COMPANY_FIIBO_ROLE_5,
        StringConst.COMPANY_FIIBO_ROLE_6,
        StringConst.COMPANY_FIIBO_ROLE_7,
        StringConst.COMPANY_FIIBO_ROLE_8,
        StringConst.COMPANY_FIIBO_ROLE_9,
      ],
      location: StringConst.LOCATION_FIIBO,
      duration: StringConst.DURATION_FIIBO,
    ),
    ExperienceData(
      company: StringConst.COMPANY_KRYKTO,
      position: StringConst.POSITION_KRYKTO,
      companyUrl: StringConst.COMPANY_KRYKTO_URL,
      roles: [
        StringConst.COMPANY_KRYKTO_ROLE_1,
        StringConst.COMPANY_KRYKTO_ROLE_2,
        StringConst.COMPANY_KRYKTO_ROLE_3,
        StringConst.COMPANY_KRYKTO_ROLE_4,
        StringConst.COMPANY_KRYKTO_ROLE_5,
        StringConst.COMPANY_KRYKTO_ROLE_6,
        StringConst.COMPANY_KRYKTO_ROLE_7,
        StringConst.COMPANY_KRYKTO_ROLE_8,
      ],
      location: StringConst.LOCATION_KRYKTO,
      duration: StringConst.DURATION_KRYKTO,
    ),
  ];
}
