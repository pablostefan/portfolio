import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:portfolio/core/injection/injection.dart';
import 'package:portfolio/core/utils/snackbar_global.dart';
import 'package:portfolio/routing/router.dart';
import 'package:portfolio/shared/theme/app_theme.dart';
import 'package:portfolio/shared/values/values.dart';

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
      child: MaterialApp.router(
        title: StringConst.APP_TITLE,
        theme: AppTheme.lightThemeData,
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: SnackbarGlobal.key,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
