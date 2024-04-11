import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_widget/views/about_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutWidget extends StatelessWidget {
  final VoidCallback openGithub;

  const AboutWidget({super.key, required this.openGithub});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => AboutDesktop(openGithub: openGithub),
        tablet: (_) => AboutDesktop(openGithub: openGithub),
        desktop: (_) => AboutDesktop(openGithub: openGithub));
  }
}
