import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/certificates/widgets/certification_widget.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';

class CertificationsListWidget extends StatelessWidget {
  const CertificationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.responsive(24, 40)),
      child: AdaptiveBuilderWidget(
        desktop: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 40,
            runSpacing: 40,
            children: List.from(Data.certificationData.map((data) => CertificationWidget(data: data))),
          ),
        ),
      ),
    );
  }
}
