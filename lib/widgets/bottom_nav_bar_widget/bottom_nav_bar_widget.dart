import 'package:flutter/material.dart';
import 'package:portfolio/widgets/bottom_nav_bar_widget/views/bottom_nav_bar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BottomNavBarWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const BottomNavBarWidget({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
        mobile: (_) => BottomNavBarDesktop(value: value, onChanged: onChanged),
        tablet: (_) => BottomNavBarDesktop(value: value, onChanged: onChanged),
        desktop: (_) => BottomNavBarDesktop(value: value, onChanged: onChanged));
  }
}
