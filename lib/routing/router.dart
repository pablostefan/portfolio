import 'package:go_router/go_router.dart';
import 'package:portfolio/presentation/about/about_page.dart';
import 'package:portfolio/presentation/certificates/certifications_page.dart';
import 'package:portfolio/presentation/contact/contact_page.dart';
import 'package:portfolio/presentation/experience/experience_page.dart';
import 'package:portfolio/presentation/home/home_page.dart';
import 'package:portfolio/presentation/not_found/not_found_page.dart';
import 'package:portfolio/presentation/project_detail/project_detail_page.dart';
import 'package:portfolio/presentation/works/works_page.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/routing/web_page.dart';

abstract final class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.home,
    errorBuilder: (context, state) => NotFoundPage(),
    redirect: (_, state) {
      if (state.path == '/') return Routes.home;
      if (state.name == '/') return Routes.home;
      return null;
    },
    routes: [
      GoRoute(
        name: Routes.home,
        path: Routes.home,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: HomePage(showAnimation: state.extra as bool? ?? false),
          );
        },
      ),
      GoRoute(
        name: Routes.about,
        path: Routes.about,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: AboutPage(),
          );
        },
      ),
      GoRoute(
        name: Routes.contact,
        path: Routes.contact,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: ContactPage(),
          );
        },
      ),
      GoRoute(
        name: Routes.work,
        path: Routes.work,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: WorksPage(),
          );
        },
      ),
      GoRoute(
        name: Routes.projectDetail,
        path: Routes.projectDetail,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: ProjectDetailPage(project: state.pathParameters['project'] as String),
          );
        },
      ),
      GoRoute(
        name: Routes.experience,
        path: Routes.experience,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: ExperiencePage(),
          );
        },
      ),
      GoRoute(
        name: Routes.certifications,
        path: Routes.certifications,
        pageBuilder: (_, state) {
          return WebPage(
            key: state.pageKey,
            child: CertificationsPage(),
          );
        },
      ),
    ],
  );
}
