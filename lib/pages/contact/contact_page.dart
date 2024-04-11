import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact/views/contact_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const ContactDesktop(),
        tablet: (_) => const ContactDesktop(),
        desktop: (_) => const ContactDesktop());
  }
}
