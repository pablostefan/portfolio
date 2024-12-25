import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/pages/about/widgets/about_header.dart';
import 'package:portfolio/presentation/pages/about/widgets/technology_section.dart';
import 'package:portfolio/presentation/pages/home/widgets/scroll_down.dart';
import 'package:portfolio/presentation/pages/widgets/animated_footer.dart';
import 'package:portfolio/presentation/pages/widgets/socials.dart';
import 'package:portfolio/presentation/widgets/animated_line_through_text.dart';
import 'package:portfolio/presentation/widgets/animated_positioned_text.dart';
import 'package:portfolio/presentation/widgets/animated_slide_transition.dart';
import 'package:portfolio/presentation/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/presentation/widgets/content_area.dart';
import 'package:portfolio/presentation/widgets/content_builder.dart';
import 'package:portfolio/presentation/widgets/custom_spacer.dart';
import 'package:portfolio/presentation/widgets/page_wrapper.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

const kDuration = Duration(milliseconds: 600);

class AboutPage extends StatefulWidget {
  static const String aboutPageRoute = StringConst.ABOUT_PAGE;

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
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.75),
      sm: assignWidth(context, 0.8),
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, 0.10),
        assignWidth(context, 0.10),
        // sm: assignWidth(context, 0.10),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, 0.15),
        assignHeight(context, 0.15),
        // sm: assignWidth(context, 0.10),
      ),
    );

    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
      // letterSpacing: 2,
    );
    TextStyle? bodySmallStyle = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? titleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
      ),
    );
    CurvedAnimation storySectionAnimation = CurvedAnimation(
      parent: _storyController,
      curve: Interval(0.6, 1.0, curve: Curves.ease),
    );
    CurvedAnimation technologySectionAnimation = CurvedAnimation(
      parent: _technologyController,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double widthOfBody = responsiveSize(
      context,
      assignWidth(context, 0.75),
      assignWidth(context, 0.5),
    );
    return PageWrapper(
      selectedRoute: AboutPage.aboutPageRoute,
      selectedPageName: StringConst.ABOUT,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: () {
        _controller.forward();
      },
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
                      AboutHeader(
                        width: contentAreaWidth,
                        controller: _controller,
                      ),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetector(
                        key: Key('story-section'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage = visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > responsiveSize(context, 40, 70, md: 50)) {
                            _storyController.forward();
                          }
                        },
                        child: ContentBuilder(
                          controller: _storyController,
                          number: "/01 ",
                          width: contentAreaWidth,
                          section: StringConst.ABOUT_DEV_STORY.toUpperCase(),
                          title: StringConst.ABOUT_DEV_STORY_TITLE,
                          body: Column(
                            children: [
                              AnimatedPositionedText(
                                controller: storySectionAnimation,
                                width: widthOfBody,
                                maxLines: 30,
                                // factor: 1.25,
                                text: StringConst.ABOUT_DEV_STORY_CONTENT_1,
                                textStyle: bodyLargeStyle,
                              ),
                              AnimatedPositionedText(
                                controller: storySectionAnimation,
                                width: widthOfBody,
                                maxLines: 30,
                                text: StringConst.ABOUT_DEV_STORY_CONTENT_2,
                                textStyle: bodyLargeStyle,
                              ),
                              AnimatedPositionedText(
                                controller: storySectionAnimation,
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
                      VisibilityDetector(
                        key: Key('technology-section'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage = visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 50) {
                            _technologyController.forward();
                          }
                        },
                        child: ContentBuilder(
                          controller: _technologyController,
                          number: "/02 ",
                          width: contentAreaWidth,
                          section: StringConst.ABOUT_DEV_TECHNOLOGY.toUpperCase(),
                          title: StringConst.ABOUT_DEV_TECHNOLOGY_TITLE,
                          body: Column(
                            children: [
                              AnimatedPositionedText(
                                controller: technologySectionAnimation,
                                width: widthOfBody,
                                maxLines: 12,
                                text: StringConst.ABOUT_DEV_TECHNOLOGY_CONTENT,
                                textStyle: bodyLargeStyle,
                              ),
                            ],
                          ),
                          footer: VisibilityDetector(
                            key: Key('technology-list'),
                            onVisibilityChanged: (visibilityInfo) {
                              double visiblePercentage = visibilityInfo.visibleFraction * 100;
                              if (visiblePercentage > 60) {
                                _technologyListController.forward();
                              }
                            },
                            child: Column(
                              children: [
                                SpaceH40(),
                                TechnologySection(
                                  width: contentAreaWidth,
                                  controller: _technologyListController,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetector(
                        key: Key('contact-section'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage = visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 50) {
                            _contactController.forward();
                          }
                        },
                        child: ContentBuilder(
                          controller: _contactController,
                          number: "/03 ",
                          width: contentAreaWidth,
                          section: StringConst.ABOUT_DEV_CONTACT.toUpperCase(),
                          title: StringConst.ABOUT_DEV_CONTACT_SOCIAL,
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpaceH20(),
                              Wrap(
                                spacing: 20,
                                runSpacing: 20,
                                children: _buildSocials(Data.socialData2),
                              ),
                            ],
                          ),
                          footer: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SpaceH40(),
                              AnimatedTextSlideBoxTransition(
                                controller: _contactController,
                                text: StringConst.ABOUT_DEV_CONTACT_EMAIL,
                                textStyle: titleStyle,
                              ),
                              SpaceH40(),
                              AnimatedLineThroughText(
                                text: StringConst.EMAIL_VALUE,
                                hasSlideBoxAnimation: true,
                                controller: _contactController,
                                onTap: () {
                                  Functions.launchUrl(StringConst.EMAIL_URL);
                                },
                                textStyle: bodySmallStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      CustomSpacer(heightFactor: 0.1),
                      VisibilityDetector(
                        key: Key('quote-section'),
                        onVisibilityChanged: (visibilityInfo) {
                          double visiblePercentage = visibilityInfo.visibleFraction * 100;
                          if (visiblePercentage > 50) {
                            _quoteController.forward();
                          }
                        },
                        child: Column(
                          children: [
                            AnimatedTextSlideBoxTransition(
                              controller: _quoteController,
                              text: StringConst.FAMOUS_QUOTE,
                              maxLines: 5,
                              width: contentAreaWidth,
                              textAlign: TextAlign.center,
                              textStyle: titleStyle?.copyWith(
                                fontSize: responsiveSize(
                                  context,
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
                              child: AnimatedTextSlideBoxTransition(
                                controller: _quoteController,
                                text: "— ${StringConst.FAMOUS_QUOTE_AUTHOR}",
                                textStyle: textTheme.bodyLarge?.copyWith(
                                  fontSize: responsiveSize(
                                    context,
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
                      CustomSpacer(heightFactor: 0.2),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 500,
                child: ResponsiveBuilder(
                  builder: (context, sizingInformation) {
                    double screenWidth = sizingInformation.screenSize.width;
                    if (screenWidth < RefinedBreakpoints().tabletNormal) {
                      return SizedBox.shrink();
                    } else {
                      return InkWell(
                        hoverColor: Colors.transparent,
                        onTap: () {
                          _scrollController.animateTo(
                            MediaQuery.sizeOf(context).height * .5,
                            duration: kDuration,
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 24, bottom: 40),
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
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          AnimatedFooter()
        ],
      ),
    );
  }

  List<Widget> _buildSocials(List<SocialData> data) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: _contactController,
          hasSlideBoxAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Functions.launchUrl(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
