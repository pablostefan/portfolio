import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_line_through_text.dart';
import 'package:portfolio/shared/widgets/socials.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SimpleFooter extends StatelessWidget {
  const SimpleFooter({
    super.key,
    this.height,
    this.width,
    this.backgroundColor = AppColors.black,
  });

  final double? width;
  final double? height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? context.widthOfScreen,
      height: height ?? context.assignHeight(.2),
      color: backgroundColor,
      child: Center(
        child: ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.isMobile) {
              return Column(
                children: [
                  Spacer(flex: 2),
                  TabletSimpleFooter(),
                  Spacer(),
                ],
              );
            } else {
              return Column(
                children: [
                  Spacer(),
                  DesktopSimpleFooter(),
                  SpaceH20(),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class TabletSimpleFooter extends StatelessWidget {
  const TabletSimpleFooter({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return Column(
      children: [
        Socials(socialData: Data.socialData),
        SpaceH30(),
        Text(StringConst.COPYRIGHT, style: style),
        SpaceW8(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Functions.launchUrl(StringConst.DAVID_COBBINA);
              },
              child: AnimatedLineThroughText(
                text: StringConst.INSPIRED,
                isUnderlinedByDefault: true,
                isUnderlinedOnHover: false,
                hoverColor: AppColors.white,
                coverColor: AppColors.black,
                textStyle: style?.copyWith(
                  decorationThickness: 1,
                  decorationColor: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SpaceW8(),
            InkWell(
              onTap: () {
                Functions.launchUrl(StringConst.DESIGN_LINK);
              },
              child: AnimatedLineThroughText(
                text: StringConst.DESIGNED_BY,
                isUnderlinedByDefault: true,
                isUnderlinedOnHover: false,
                hoverColor: AppColors.white,
                coverColor: AppColors.black,
                textStyle: style?.copyWith(
                  decorationThickness: 1,
                  decorationColor: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SpaceH20(),
        BuiltWithFlutter(),
      ],
    );
  }
}

class DesktopSimpleFooter extends StatelessWidget {
  const DesktopSimpleFooter({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.accentColor, fontSize: Sizes.TEXT_SIZE_14);

    return Column(
      children: [
        Socials(socialData: Data.socialData),
        SpaceH20(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(StringConst.COPYRIGHT, style: style),
            SpaceW8(),
            InkWell(
              onTap: () {
                Functions.launchUrl(StringConst.DAVID_COBBINA);
              },
              child: AnimatedLineThroughText(
                text: StringConst.INSPIRED,
                isUnderlinedByDefault: true,
                isUnderlinedOnHover: false,
                hoverColor: AppColors.white,
                coverColor: AppColors.black,
                textStyle: style?.copyWith(
                  decorationThickness: 1,
                  decorationColor: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SpaceW8(),
            InkWell(
              onTap: () {
                Functions.launchUrl(StringConst.DESIGN_LINK);
              },
              child: AnimatedLineThroughText(
                text: StringConst.DESIGNED_BY,
                isUnderlinedByDefault: true,
                isUnderlinedOnHover: false,
                hoverColor: AppColors.white,
                coverColor: AppColors.black,
                textStyle: style?.copyWith(
                  decorationThickness: 1,
                  decorationColor: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        SpaceH20(),
        BuiltWithFlutter(),
      ],
    );
  }
}

class BuiltWithFlutter extends StatelessWidget {
  const BuiltWithFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: AppColors.accentColor,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(StringConst.BUILT_WITH_FLUTTER, style: style),
        SpaceW8(),
        FlutterLogo(size: 18),
      ],
    );
  }
}
