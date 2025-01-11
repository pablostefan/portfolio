import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Lottie.asset(
            Animations.notFound,
            fit: BoxFit.contain,
            width: context.widthOfScreen,
            height: context.heightOfScreen * 0.8,
            animate: true,
          ),
          PortfolioButton(
            height: Sizes.HEIGHT_30,
            hasIcon: false,
            width: 90,
            buttonColor: AppColors.white,
            borderColor: AppColors.black,
            onHoverColor: AppColors.black,
            title: StringConst.GO_HOME,
            onPressed: () => context.go(Routes.home),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
