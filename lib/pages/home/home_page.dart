import 'package:flutter/material.dart';
import 'package:portfolio/pages/home/views/home_view_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => const HomeViewDesktop(),
        tablet: (_) => const HomeViewDesktop(),
        desktop: (_) => const HomeViewDesktop());
  }
}
