import 'package:flutter/material.dart';
import 'package:portfolio/pages/error/views/error_view_desktop.dart';
import 'package:portfolio/pages/error/views/error_view_mobile.dart';
import 'package:portfolio/pages/error/views/error_view_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const ErrorViewMobile(),
        tablet: (_) => const ErrorViewTablet(),
        desktop: (_) => const ErrorViewDesktop());
  }
}
