import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/about/widgets/about_header.dart';
import 'package:portfolio/presentation/about/widgets/technology_section.dart';
import 'package:portfolio/presentation/home/widgets/scroll_down.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_footer.dart';
import 'package:portfolio/shared/widgets/animated_line_through_text.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_slide_transition.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/content_builder.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

const kDuration = Duration(milliseconds: 600);

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _storyController;
  late AnimationController _technologyController;
  late AnimationController _contactController;
  late AnimationController _technologyListController;
  late AnimationController _quoteController;
  late AnimationController _scrollDownButtonController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollDownButtonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _storyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _technologyListController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _contactController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _quoteController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _storyController.dispose();
    _technologyController.dispose();
    _technologyListController.dispose();
    _contactController.dispose();
    _quoteController.dispose();
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
      top: context.responsive(context.assignHeight(.15), context.assignHeight(.2), sm: context.assignWidth(.15)),
    );

    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: context.responsive(15, 17, sm: 15, md: 16, xl: 17),
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );

    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );

    TextStyle? bodySmallStyle = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);

    TextStyle? titleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_20),
    );

    double widthOfBody = context.responsive(context.assignWidth(.75), context.assignWidth(.5));

    return PageWrapper(
      selectedRoute: Routes.about,
      selectedPageName: StringConst.ABOUT,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        controller: _scrollController,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Stack(
            children: [
              Padding(
                padding: padding,
                child: ContentArea(
                  width: contentAreaWidth,
                  child: Column(
                    children: [
                      AboutHeader(width: contentAreaWidth, controller: _controller),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetectorWidget(
                        key: Key('story-section'),
                        action: _storyController.forward,
                        context: context,
                        minVisible: 40,
                        child: ContentBuilder(
                          controller: _storyController,
                          number: "/01 ",
                          width: contentAreaWidth,
                          section: StringConst.ABOUT_DEV_STORY.toUpperCase(),
                          title: StringConst.ABOUT_DEV_STORY_TITLE,
                          body: Column(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 20,
                            children: [
                              AnimatedPositionedText(
                                controller: _storyController,
                                width: widthOfBody,
                                maxLines: 30,
                                text: StringConst.ABOUT_DEV_STORY_CONTENT_1,
                                textStyle: bodyLargeStyle,
                              ),
                              AnimatedPositionedText(
                                controller: _storyController,
                                width: widthOfBody,
                                maxLines: 30,
                                text: StringConst.ABOUT_DEV_STORY_CONTENT_2,
                                textStyle: bodyLargeStyle,
                              ),
                              AnimatedPositionedText(
                                controller: _storyController,
                                width: widthOfBody,
                                maxLines: 30,
                                text: StringConst.ABOUT_DEV_STORY_CONTENT_3,
                                textStyle: bodyLargeStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetectorWidget(
                        key: Key('technology-section'),
                        minVisible: 30,
                        action: _technologyController.forward,
                        context: context,
                        child: ContentBuilder(
                          controller: _technologyController,
                          number: "/02 ",
                          width: contentAreaWidth,
                          section: StringConst.ABOUT_DEV_TECHNOLOGY.toUpperCase(),
                          title: StringConst.ABOUT_DEV_TECHNOLOGY_TITLE,
                          body: AnimatedPositionedText(
                            controller: _technologyController,
                            width: widthOfBody,
                            maxLines: 12,
                            text: StringConst.ABOUT_DEV_TECHNOLOGY_CONTENT,
                            textStyle: bodyLargeStyle,
                          ),
                          footer: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: VisibilityDetectorWidget(
                              key: Key('technology-list'),
                              context: context,
                              minVisible: 40,
                              action: _technologyListController.forward,
                              child: TechnologySection(
                                width: contentAreaWidth,
                                controller: _technologyListController,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetectorWidget(
                        key: Key('contact-section'),
                        context: context,
                        minVisible: 50,
                        action: _contactController.forward,
                        child: ContentBuilder(
                          controller: _contactController,
                          number: "/03 ",
                          width: contentAreaWidth,
                          section: StringConst.ABOUT_DEV_CONTACT.toUpperCase(),
                          title: StringConst.GET_IN_TOUCH,
                          body: SizedBox(
                            height: 40,
                            child: ListView.separated(
                              itemCount: Data.socialData.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (_, __) => Text(' / ', style: bodySmallStyle),
                              itemBuilder: (_, index) => AnimatedLineThroughText(
                                text: Data.socialData[index].name,
                                isUnderlinedByDefault: true,
                                controller: _contactController,
                                hasSlideBoxAnimation: true,
                                isUnderlinedOnHover: false,
                                onTap: () => Functions.launchUrl(Data.socialData[index].url),
                                textStyle: slashStyle,
                              ),
                            ),
                          ),
                          footer: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpaceH30(),
                              TextSlideBoxWidget(
                                controller: _contactController,
                                text: StringConst.ABOUT_DEV_CONTACT_EMAIL,
                                textStyle: titleStyle,
                              ),
                              SpaceH12(),
                              AnimatedLineThroughText(
                                text: StringConst.EMAIL_VALUE,
                                hasSlideBoxAnimation: true,
                                controller: _contactController,
                                onTap: () => Functions.launchUrl(StringConst.EMAIL_URL),
                                textStyle: bodySmallStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetectorWidget(
                        key: Key('quote-section'),
                        context: context,
                        minVisible: 50,
                        action: _quoteController.forward,
                        child: Column(
                          children: [
                            TextSlideBoxWidget(
                              controller: _quoteController,
                              text: StringConst.FAMOUS_QUOTE,
                              maxLines: 5,
                              width: contentAreaWidth,
                              textAlign: TextAlign.center,
                              textStyle: titleStyle?.copyWith(
                                fontSize: context.responsive(
                                  Sizes.TEXT_SIZE_24,
                                  Sizes.TEXT_SIZE_36,
                                  md: Sizes.TEXT_SIZE_28,
                                ),
                                height: 2.0,
                              ),
                            ),
                            SpaceH20(),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextSlideBoxWidget(
                                controller: _quoteController,
                                text: "— ${StringConst.FAMOUS_QUOTE_AUTHOR}",
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  fontSize: context.responsive(
                                    Sizes.TEXT_SIZE_16,
                                    Sizes.TEXT_SIZE_18,
                                    md: Sizes.TEXT_SIZE_16,
                                  ),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.grey600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomSpacer(heightFactor: 0.1),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 500,
                child: AdaptiveBuilderWidget(
                  desktop: InkWell(
                    hoverColor: Colors.transparent,
                    onTap: () {
                      _scrollController.animateTo(
                        MediaQuery.sizeOf(context).height * .5,
                        duration: kDuration,
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: context.responsive(8, 24), bottom: 40),
                      child: MouseRegion(
                        onEnter: (e) => _scrollDownButtonController.forward(),
                        onExit: (e) => _scrollDownButtonController.reverse(),
                        child: AnimatedSlideTransition(
                          controller: _scrollDownButtonController,
                          beginOffset: Offset(0, 0),
                          targetOffset: Offset(0, 0.1),
                          child: ScrollDownButton(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          AnimatedFooter()
        ],
      ),
    );
  }
}
