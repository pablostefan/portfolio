part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
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
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(name: StringConst.EXPERIENCE, route: StringConst.EXPERIENCE_PAGE),
    NavItemData(name: StringConst.CERTIFICATIONS, route: StringConst.CERTIFICATION_PAGE),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
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

  static List<String> mobileTechnologies = ["Android", "Kotlin", "Flutter", "Dart", "Swift", "SwiftUI"];

  static List<String> otherTechnologies = [
    "HTML 5",
    "CSS 3",
    "JavaScript",
    "Typescript",
    "React JS",
    "Next JS",
    "Node JS",
    "Git",
    "AWS",
    "Docker",
    "Google Cloud",
    "Azure",
    "Travis CI",
    "Circle CI",
    "Express",
    "C++",
    "Firebase",
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
    Projects.FIIBO,
    Projects.KRYKTO,
  ];

  static List<ProjectItemData> projects = [
    Projects.FIIBO,
    Projects.KRYKTO,
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.UDAGRAM_IMAGE_FILTERING,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.UDAGRAM_IMAGE_FILTERING_TECH,
      projectDescription: StringConst.UDAGRAM_IMAGE_FILTERING_DETAIL,
      gitHubUrl: StringConst.UDAGRAM_IMAGE_FILTERING_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.SERVERLESS_TODO,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.SERVERLESS_TODO_TECH,
      projectDescription: StringConst.SERVERLESS_TODO_DETAIL,
      gitHubUrl: StringConst.SERVERLESS_TODO_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PYTHON_ALGORITHMS,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PYTHON_ALGORITHMS_DETAIL,
      gitHubUrl: StringConst.PYTHON_ALGORITHMS_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.PROGRAMMING_FOR_DATA_SCIENCE,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.PYTHON,
      projectDescription: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_DETAIL,
      gitHubUrl: StringConst.PROGRAMMING_FOR_DATA_SCIENCE_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.ONBOARDING_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.ONBOARDING_APP_DETAIL,
      gitHubUrl: StringConst.ONBOARDING_APP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.FINOPP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.FINOPP_DETAIL,
      gitHubUrl: StringConst.FINOPP_GITHUB_URL,
      isLive: false,
    ),
    NoteWorthyProjectDetails(
      projectName: StringConst.AMOR_APP,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: true,
      technologyUsed: StringConst.FLUTTER,
      projectDescription: StringConst.AMOR_APP_DETAIL,
      gitHubUrl: StringConst.AMOR_APP_GITHUB_URL,
      webUrl: StringConst.AMOR_APP_WEB_URL,
      isLive: true,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.XP_MOBILE,
      url: StringConst.XP_CERT_URL,
      image: ImagePath.XP_MOBILE_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.XP_EDUCATION,
    ),
    CertificationData(
      title: StringConst.XP_ARCHITECT,
      url: StringConst.XP_CERT_URL,
      image: ImagePath.XP_ARCHITECT_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.XP_EDUCATION,
    ),
    CertificationData(
      title: StringConst.COODESH_TITLE,
      url: StringConst.COODESH_URL,
      image: ImagePath.COODESH_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.COODESH,
    ),
    CertificationData(
      title: StringConst.FLUTTER_ANDROID,
      url: StringConst.FLUTTER_ANDROID_URL,
      image: ImagePath.FLUTTER_ANDROID_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDEMY,
    ),
    CertificationData(
      title: StringConst.ANDROID,
      url: StringConst.ANDROID_CERT_URL,
      image: ImagePath.ANDROID_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.UDEMY,
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

class Projects {
  static ProjectItemData FIIBO = ProjectItemData(
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
      webUrl: StringConst.FIIBO_URL,
      technologyUsed: StringConst.FLUTTER);

  static ProjectItemData KRYKTO = ProjectItemData(
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
      technologyUsed: StringConst.FLUTTER);
}
