import 'package:flutter/material.dart';
import 'package:portfolio/presentation/certificates/widgets/certifications_list_widget.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_header.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';

class CertificationsPage extends StatefulWidget {
  const CertificationsPage({super.key});

  @override
  State<CertificationsPage> createState() => _CertificationsPageState();
}

class _CertificationsPageState extends State<CertificationsPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Animations.slideAnimationDurationLong);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      selectedRoute: Routes.certifications,
      selectedPageName: StringConst.CERTIFICATIONS,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          PageHeader(headingText: StringConst.CERTIFICATIONS, headingTextController: _controller),
          CertificationsListWidget(),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }
}
