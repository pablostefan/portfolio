import 'package:flutter/cupertino.dart';
import 'package:portfolio/models/about_me/about_me_selected_page_model.dart';

class AboutMeViewModel {
  PageController pageController = PageController();
  AboutMePageModel selectedPage = AboutMePageModel.bio;

  AboutMeViewModel copyWith({AboutMePageModel? selectedPage}) {
    return AboutMeViewModel()
      ..selectedPage = selectedPage ?? this.selectedPage
      ..pageController = pageController;
  }
}
