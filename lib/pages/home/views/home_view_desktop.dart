import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/pages/about_me/about_me_page.dart';
import 'package:portfolio/pages/contact/contact_page.dart';
import 'package:portfolio/pages/hello/hello_page.dart';
import 'package:portfolio/stores/home/home_store.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/view_models/home/home_view_model.dart';
import 'package:portfolio/widgets/app_bar/views/app_bar_desktop.dart';
import 'package:portfolio/widgets/bottom_nav_bar/bottom_nav_bar_desktop.dart';

class HomeViewDesktop extends StatefulWidget {
  const HomeViewDesktop({super.key});

  @override
  State<HomeViewDesktop> createState() => _HomeViewDesktopState();
}

class _HomeViewDesktopState extends State<HomeViewDesktop> {
  final HomeStore _store = GetIt.I<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<HomeStore, HomeViewModel>(
        store: _store,
        builder: (_, triple) => Scaffold(
            backgroundColor: AppColors.primaryTwo,
            extendBodyBehindAppBar: true,
            extendBody: true,
            appBar: AppBarDesktop(onTap: _store.onTapAppBarButton, selected: triple.state.selected),
            body: PageView(controller: triple.state.pageController, children: [
              Container(color: AppColors.primaryTwo),
              HelloPage(openGithub: _store.openGithub),
              const AboutMePage(),
              Container(color: AppColors.primaryTwo),
              const ContactPage()
            ]),
            bottomNavigationBar: BottomNavBarDesktop(onChanged: _store.setLanguage)));
  }
}
