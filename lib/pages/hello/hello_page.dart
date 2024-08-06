import 'package:flutter/material.dart';
import 'package:portfolio/pages/hello/views/hello_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HelloPage extends StatelessWidget {
  final VoidCallback openGithub;

  const HelloPage({super.key, required this.openGithub});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => HelloDesktop(openGithub: openGithub),
        tablet: (_) => HelloDesktop(openGithub: openGithub),
        desktop: (_) => HelloDesktop(openGithub: openGithub));
  }
}
