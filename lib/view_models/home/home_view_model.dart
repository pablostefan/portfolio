import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_bar_widget/models/app_bar_button.dart';

class HomeViewModel {
  AppBarButton selected = AppBarButton.hello;
  PageController pageController = PageController(initialPage: AppBarButton.hello.index);
  bool inEn = false;

  HomeViewModel copyWith({AppBarButton? selected, bool? inEn}) {
    return HomeViewModel()
      ..pageController = pageController
      ..inEn = inEn ?? this.inEn
      ..selected = selected ?? this.selected;
  }
}
