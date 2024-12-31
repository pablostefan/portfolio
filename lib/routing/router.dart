import 'package:flutter/material.dart';
import 'package:portfolio/presentation/pages/about/about_page.dart';
import 'package:portfolio/presentation/pages/certification_page.dart';
import 'package:portfolio/presentation/pages/contact_page.dart';
import 'package:portfolio/presentation/pages/error/error_page.dart';
import 'package:portfolio/presentation/pages/experience_page.dart';
import 'package:portfolio/presentation/pages/home/home_page.dart';
import 'package:portfolio/presentation/pages/privacy_policy_page.dart';
import 'package:portfolio/presentation/pages/project_detail/project_detail_page.dart';
import 'package:portfolio/presentation/pages/works/works_page.dart';
import 'package:portfolio/routing/path.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/widgets/no_animation_material_page_route.dart';

class RouteConfiguration {
  /// List of [Path] to for route matching. When a named route is pushed with
  /// [Navigator.pushNamed], the route name is matched with the [Path.pattern]
  /// in the list below. As soon as there is a match, the associated builder
  /// will be returned. This means that the paths higher up in the list will
  /// take priority.
  static List<RoutePath> paths = [
    RoutePath(r'^' + Routes.privacyPolicy, (context, matches) => const PrivacyPolicyPage()),
    RoutePath(r'^' + Routes.contact, (context, matches) => const ContactPage()),
    RoutePath(r'^' + Routes.about, (context, matches) => const AboutPage()),
    RoutePath(r'^' + Routes.work, (context, matches) => const WorksPage()),
    RoutePath(r'^' + Routes.projectDetail, (context, matches) => const ProjectDetailPage()),
    RoutePath(r'^' + Routes.experience, (context, matches) => const ExperiencePage()),
    RoutePath(r'^' + Routes.certifications, (context, matches) => const CertificationPage()),
    RoutePath(r'^' + Routes.home, (context, matches) => HomePage()),
  ];

  static Route<dynamic>? _onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const ErrorPage(), settings: settings);
  }

  static Route<dynamic>? _defaultRoute(RouteSettings settings) {
    for (RoutePath path in paths) {
      final regExpPattern = RegExp(path.pattern);

      // Verificar correspondência de padrão
      if (regExpPattern.hasMatch(settings.name!)) {
        final firstMatch = regExpPattern.firstMatch(settings.name!);

        // Preencher grupos capturados
        final groupMap = <String, String>{};
        if (firstMatch != null) {
          for (final groupName in firstMatch.groupNames) {
            groupMap[groupName] = firstMatch.namedGroup(groupName)!;
          }
        }

        return NoAnimationMaterialPageRoute<void>(
          builder: (context) => path.builder(context, groupMap),
          settings: settings,
        );
      }
    }
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == null) return _onUnknownRoute(settings);
    return _defaultRoute(settings) ?? _onUnknownRoute(settings);
  }
}
