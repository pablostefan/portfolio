import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';

class TabletCardInfoWidget extends StatelessWidget {
  final String actionTitle;
  final GestureTapCallback? onTap;

  const TabletCardInfoWidget({super.key, required this.actionTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        PortfolioButton(
          height: Sizes.HEIGHT_36,
          hasIcon: false,
          width: 90,
          buttonColor: AppColors.white,
          borderColor: AppColors.black,
          onHoverColor: AppColors.black,
          title: actionTitle.toUpperCase(),
          onPressed: onTap,
        ),
        SizedBox(height: Sizes.HEIGHT_16),
      ],
    );
  }
}
