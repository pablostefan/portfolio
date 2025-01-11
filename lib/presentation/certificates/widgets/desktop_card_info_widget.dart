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

    return Container(
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
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.black),
          ),
          SpaceH4(),
          Text(
            data.awardedBy,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
              fontSize: Sizes.TEXT_SIZE_16,
            ),
          ),
          Visibility(visible: data.code?.isNotEmpty ?? false, child: SpaceH4()),
          Visibility(
            visible: data.code?.isNotEmpty ?? false,
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: StringConst.CODE,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.black,
                      fontSize: Sizes.TEXT_SIZE_14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: data.code,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.black,
                      fontSize: Sizes.TEXT_SIZE_14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SpaceH16(),
          Container(
            height: Sizes.HEIGHT_36,
            width: 90,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.2),
                  blurRadius: 6,
                  offset: const Offset(3, 3),
                ),
              ],
            ),
            child: PortfolioButton(
              height: Sizes.HEIGHT_36,
              hasIcon: false,
              width: 90,
              buttonColor: AppColors.white,
              borderColor: AppColors.black,
              onHoverColor: AppColors.black,
              title: StringConst.VIEW.toUpperCase(),
              onPressed: () => Functions.launchUrl(data.url),
            ),
          ),
        ],
      ),
    );
  }
}
