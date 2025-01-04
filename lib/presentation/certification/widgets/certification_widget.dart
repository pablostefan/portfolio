import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/certification_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CertificationWidget extends StatelessWidget {
  final AnimationController certificationsController;
  final int index;
  final double width;
  final double spacing;

  const CertificationWidget({
    super.key,
    required this.certificationsController,
    required this.width,
    required this.spacing,
    required this.index,
  });

  double get _duration => certificationsController.duration!.inMilliseconds.roundToDouble();

  double get _durationForEach => certificationsController.duration!.inMilliseconds / Data.certificationData.length;

  double get _start => _durationForEach * index;

  double get _end => _durationForEach * (index + 1);

  CertificationData get _data => Data.certificationData[index];

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(
          parent: certificationsController,
          curve: Interval(
            !_start.isNegative ? _start / _duration : 0,
            !_end.isNegative ? _end / _duration : 1,
            curve: Curves.easeIn,
          ),
        ),
      ),
      child: CertificationCard(
        imageUrl: _data.image,
        onTap: () => Functions.launchUrl(_data.url),
        title: _data.title,
        subtitle: _data.awardedBy,
        actionTitle: StringConst.VIEW,
        isMobileOrTablet: context.widthOfScreen <= RefinedBreakpoints().tabletNormal ? true : false,
        height: context.assignHeight(.45),
        width:
            context.widthOfScreen <= RefinedBreakpoints().tabletSmall ? context.assignWidth(.8) : (width - spacing) / 2,
      ),
    );
  }
}
