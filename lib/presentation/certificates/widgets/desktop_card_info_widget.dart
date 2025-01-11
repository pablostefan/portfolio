import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class DesktopCardInfoWidget extends StatelessWidget {
  final CertificationData data;

  const DesktopCardInfoWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return ClipRect(
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          width: double.infinity,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.RADIUS_8),
          ),
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(color: AppColors.black),
              ),
              SpaceH4(),
              Text(
                data.awardedBy,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: AppColors.black,
                  fontSize: Sizes.TEXT_SIZE_16,
                ),
              ),
              SpaceH16(),
              PortfolioButton(
                height: Sizes.HEIGHT_36,
                hasIcon: false,
                width: 90,
                buttonColor: AppColors.white,
                borderColor: AppColors.black,
                onHoverColor: AppColors.black,
                title: StringConst.VIEW.toUpperCase(),
                onPressed: () => Functions.launchUrl(data.url),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
