import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/certification/widgets/certification_widget.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_header.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

class CertificationPage extends StatefulWidget {
  const CertificationPage({super.key});

  @override
  State<CertificationPage> createState() => _CertificationPageState();
}

class _CertificationPageState extends State<CertificationPage> with TickerProviderStateMixin {
  late AnimationController _certificationsController;
  late AnimationController _headingTextController;

  @override
  void initState() {
    _certificationsController = AnimationController(
      duration: Animations.slideAnimationDurationShort,
      vsync: this,
    );
    _headingTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );

    super.initState();
  }

  @override
  void dispose() {
    _headingTextController.dispose();
    _certificationsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spacing = context.assignWidth(.05);
    double contentAreaWidth = context.responsive(
      context.assignWidth(.8),
      context.assignWidth(.7),
      sm: context.assignWidth(.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: context.responsive(context.assignWidth(.1), context.assignWidth(.15)),
      right: context.responsive(context.assignWidth(.1), context.assignWidth(.15), sm: context.assignWidth(.1)),
      top: context.responsive(context.assignHeight(.15), context.assignHeight(.15), sm: context.assignWidth(.1)),
    );
    return PageWrapper(
      selectedRoute: Routes.certifications,
      selectedPageName: StringConst.CERTIFICATIONS,
      navBarAnimationController: _headingTextController,
      onLoadingAnimationDone: () {
        _headingTextController.forward();
      },
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.CERTIFICATIONS,
            headingTextController: _headingTextController,
          ),
          VisibilityDetectorWidget(
            key: Key('certifications'),
            context: context,
            minVisible: 40,
            action: _certificationsController.forward,
            child: Padding(
              padding: padding,
              child: ContentArea(
                width: contentAreaWidth,
                child: AnimatedBuilder(
                  animation: _certificationsController,
                  builder: (context, child) {
                    return Wrap(
                      direction: Axis.horizontal,
                      spacing: context.assignWidth(.05),
                      runSpacing: context.assignHeight(0.02),
                      children: List.generate(
                        Data.certificationData.length,
                        (index) => CertificationWidget(
                          certificationsController: _certificationsController,
                          index: index,
                          width: contentAreaWidth,
                          spacing: spacing,
                        ),
                      ),
                    );
                  },
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
