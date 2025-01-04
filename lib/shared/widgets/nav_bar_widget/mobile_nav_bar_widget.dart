import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/app_logo.dart';

class MobileNavBarWidget extends StatelessWidget {
  final Color appLogoColor;
  final GestureTapCallback? onMenuTap;

  const MobileNavBarWidget({super.key, required this.appLogoColor, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthOfScreen,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(Sizes.RADIUS_12)),
          boxShadow: [BoxShadow(blurRadius: 5, color: AppColors.grey200)]),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_30, vertical: Sizes.PADDING_8),
      child: Row(
        children: [
          AppLogo(fontSize: Sizes.TEXT_SIZE_40, titleColor: appLogoColor),
          Spacer(),
          InkWell(
            onTap: onMenuTap,
            child: Icon(FeatherIcons.menu, size: Sizes.TEXT_SIZE_30, color: appLogoColor),
          ),
        ],
      ),
    );
  }
}
