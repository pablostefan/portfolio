import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/app/app_module.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
    FlutterLocalization.instance.init(initLanguageCode: "pt", mapLocales: [
      const MapLocale("en", AppLocale.en, countryCode: "US"),
      const MapLocale("pt", AppLocale.pt, countryCode: "BR"),
    ]);
    FlutterLocalization.instance.onTranslatedLanguage = (locale) => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
        builder: (_) => MaterialApp.router(
              title: 'Pablo Stefan',
              routerConfig: AppModule.router,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: FlutterLocalization.instance.localizationsDelegates,
              supportedLocales: FlutterLocalization.instance.supportedLocales,
            )).animate().fadeIn(delay: const Duration(milliseconds: 50), duration: const Duration(milliseconds: 400));
  }
}
