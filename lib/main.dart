import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:portfolio/app/app_module.dart';
import 'package:portfolio/app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule.init();
  usePathUrlStrategy();
  runApp(const MainApp());
}
