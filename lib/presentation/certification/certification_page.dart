import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/certification/widgets/certification_widget.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_header.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';

class CertificationPage extends StatefulWidget {
  const CertificationPage({super.key});

  @override
  State<CertificationPage> createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage> with SingleTickerProviderStateMixin {
  late AnimationController _headingTextController;

  @override
  void initState() {
    super.initState();
    _headingTextController = AnimationController(vsync: this, duration: Animations.slideAnimationDurationLong);
  }

  @override
  void dispose() {
    _headingTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedRoute: Routes.certifications,
      selectedPageName: StringConst.CERTIFICATIONS,
      navBarAnimationController: _headingTextController,
      onLoadingAnimationDone: _headingTextController.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          PageHeader(
            headingText: StringConst.CERTIFICATIONS,
            headingTextController: _headingTextController,
          ),
          Padding(
            padding: EdgeInsets.only(top: context.responsive(24, 40)),
            child: AdaptiveBuilderWidget(
              tabletSmall: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 24,
                children: List.generate(
                  Data.certificationData.length,
                  (index) => CertificationWidget(index: index),
                ),
              ),
              desktop: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 40,
                  runSpacing: 40,
                  children: List.generate(
                    Data.certificationData.length,
                    (index) => CertificationWidget(index: index),
                  ),
                ),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }
}
