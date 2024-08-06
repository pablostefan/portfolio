import 'package:flutter/material.dart';
import 'package:portfolio/widgets/app_bar/models/app_bar_button.dart';

class HomeViewModel {
  AppBarButton selected = AppBarButton.hello;
  PageController pageController = PageController(initialPage: AppBarButton.hello.index);

  HomeViewModel copyWith({AppBarButton? selected, bool? inEn}) {
    return HomeViewModel()
      ..pageController = pageController
      ..selected = selected ?? this.selected;
  }
}
