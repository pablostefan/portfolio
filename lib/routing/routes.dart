abstract final class Routes {
  static const String home = "/home";
  static const String about = "/about";
  static const String work = "/works";
  static const String contact = "/contact";
  static const String project = "/project";
  static const String projectDetail = "/project-detail/:project";
  static const String services = "/services";
  static const String message = "/message";
  static const String experience = "/experience";
  static const String resume = "/resume";
  static const String certifications = "/certifications";

  static String projectDetailRoute(String? project) => "/project-detail/$project";
}
