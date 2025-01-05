import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/experience/widgets/experience_widget.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_footer.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_header.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double contentAreaWidth = context.responsive(
      context.assignWidth(.8),
      context.assignWidth(.75),
      sm: context.assignWidth(.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: context.responsive(context.assignWidth(.1), context.assignWidth(.15)),
      right: context.responsive(context.assignWidth(.1), context.assignWidth(.1)),
      top: context.responsive(context.assignHeight(.15), context.assignHeight(.15)),
    );

    return PageWrapper(
      selectedRoute: Routes.experience,
      selectedPageName: StringConst.EXPERIENCE,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          PageHeader(
            headingText: StringConst.EXPERIENCE,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: ListView.separated(
                itemCount: Data.experienceData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => CustomSpacer(heightFactor: 0.1),
                itemBuilder: (_, index) => ExperienceWidget(data: Data.experienceData[index], width: contentAreaWidth),
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          AnimatedFooter(),
        ],
      ),
    );
  }
}
