import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/certification/widgets/certification_card/certification_card_widget.dart';
import 'package:portfolio/shared/values/values.dart';

class CertificationWidget extends StatelessWidget {
  final int index;

  const CertificationWidget({super.key, required this.index});

  CertificationData get _data => Data.certificationData[index];

  @override
  Widget build(BuildContext context) {
    return CertificationCardWidget(
      imageUrl: _data.image,
      onTap: () => Functions.launchUrl(_data.url),
      title: _data.title,
      subtitle: _data.awardedBy,
      actionTitle: StringConst.VIEW,
    );
  }
}
