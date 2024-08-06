import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/error/error_page.dart';
import 'package:portfolio/pages/home/home_page.dart';
import 'package:portfolio/stores/about_me/about_me_store.dart';
import 'package:portfolio/stores/contact/contact_store.dart';
import 'package:portfolio/stores/home/home_store.dart';
import 'package:portfolio/stores/projects/projects_store.dart';

class AppModule {
  static final router = GoRouter(
      initialLocation: '/',
      errorBuilder: (context, state) => const ErrorPage(),
      routes: [GoRoute(path: '/', builder: (context, state) => const HomePage())]);

  static void init() {
    GetIt.I.registerSingleton<HomeStore>(HomeStore());
    GetIt.I.registerFactory<AboutMeStore>(() => AboutMeStore());
    GetIt.I.registerFactory<ContactStore>(() => ContactStore());
    GetIt.I.registerFactory<ProjectsStore>(() => ProjectsStore());
  }
}
