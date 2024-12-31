import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/core/injection/injection.dart';
import 'package:portfolio/routing/router.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/values/values.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  @override
  void initState() {
    super.initState();
    Injection.init();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: MaterialApp(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        onGenerateRoute: RouteConfiguration.onGenerateRoute,
      ),
    );
  }
}
