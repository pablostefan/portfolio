import 'package:flutter/material.dart';
import 'package:portfolio/widgets/about_me_text_widget/views/about_me_text_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutMeTextWidget extends StatelessWidget {
  const AboutMeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const AboutMeTextDesktop(),
        tablet: (_) => const AboutMeTextDesktop(),
        desktop: (_) => const AboutMeTextDesktop());
  }
}
