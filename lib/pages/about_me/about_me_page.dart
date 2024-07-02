import 'package:flutter/material.dart';
import 'package:portfolio/pages/about_me/views/about_me_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const AboutMeDesktop(),
        tablet: (_) => const AboutMeDesktop(),
        desktop: (_) => const AboutMeDesktop());
  }
}
