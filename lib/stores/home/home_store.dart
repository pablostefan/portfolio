import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:portfolio/ui_helpers/app_language.dart';
import 'package:portfolio/view_models/home/home_view_model.dart';
import 'package:portfolio/widgets/app_bar/models/app_bar_button.dart';

class HomeStore extends Store<HomeViewModel> {
  HomeStore() : super(HomeViewModel());

  void setLanguage(bool inEn) {
    var language = inEn ? Languages.enUs : Languages.ptBr;
    FlutterLocalization.instance.translate(language.languageCode);
  }

  void onTapAppBarButton(AppBarButton button) {
    state.pageController.jumpToPage(button.index);
    update(state.copyWith(selected: button));
  }

  void openGithub() {}
}
