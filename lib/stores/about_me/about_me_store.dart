import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:portfolio/models/about_me_selected_page_model.dart';
import 'package:portfolio/view_models/about_me/about_me_view_model.dart';

class AboutMeStore extends Store<AboutMeViewModel> {
  AboutMeStore() : super(AboutMeViewModel());

  void onTapMenuItem(AboutMePageModel page) {
    state.pageController.animateToPage(page.index, duration: Durations.short1, curve: Curves.easeInOut);
    update(state.copyWith(selectedPage: page));
  }
}
