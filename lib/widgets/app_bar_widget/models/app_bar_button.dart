import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/l10n/app_locale.dart';

enum AppBarButton {
  name,
  hello,
  about,
  projects,
  contact;

  String getTitle(BuildContext context) {
    switch (this) {
      case AppBarButton.name:
        return AppLocale.shortName.getString(context);
      case AppBarButton.hello:
        return AppLocale.hello.getString(context);
      case AppBarButton.about:
        return AppLocale.aboutMe.getString(context);
      case AppBarButton.projects:
        return AppLocale.projects.getString(context);
      case AppBarButton.contact:
        return AppLocale.contactMe.getString(context);
    }
  }
}
