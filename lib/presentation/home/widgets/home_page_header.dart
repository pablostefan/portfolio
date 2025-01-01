import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/home/widgets/scroll_down.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_bubble_button.dart';
import 'package:portfolio/shared/widgets/animated_line_through_text.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_positioned_widget.dart';
import 'package:portfolio/shared/widgets/animated_slide_transition.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/socials.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:responsive_builder/responsive_builder.dart';

const kDuration = Duration(milliseconds: 600);

class HomePageHeader extends StatefulWidget {
  const HomePageHeader({
    super.key,
    required this.scrollToWorksKey,
    required this.controller,
  });

  final GlobalKey scrollToWorksKey;
  final AnimationController controller;

  @override
  State<HomePageHeader> createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _lottieController;
  late AnimationController _scrollDownButtonController;

  @override
  void initState() {
    super.initState();

    _scrollDownButtonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _lottieController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _lottieController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lottieController.reset();
        _lottieController.forward();
      }
    });
    _controller.forward();
    _lottieController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollDownButtonController.dispose();
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = widthOfScreen(context);
    final double screenHeight = heightOfScreen(context);
    final EdgeInsets textMargin = EdgeInsets.only(
      left: responsiveSize(
        context,
        20,
        screenWidth * 0.15,
        sm: screenWidth * 0.15,
      ),
      top: responsiveSize(
        context,
        60,
        screenHeight * 0.35,
        sm: screenHeight * 0.35,
      ),
      bottom: responsiveSize(context, 20, 40),
    );
    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.1,
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: responsiveSize(
        context,
        20,
        screenWidth * 0.05,
        sm: screenWidth * 0.05,
      ),
      top: responsiveSize(
        context,
        30,
        screenHeight * 0.17,
        sm: screenHeight * 0.17,
      ),
      bottom: responsiveSize(context, 20, 40),
    );

    return Container(
      width: screenWidth,
      color: AppColors.accentColor2.withOpacity(0.35),
      child: Stack(
        children: [
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < RefinedBreakpoints().tabletNormal) {
              return Column(
                children: [
                  Container(
                    padding: padding,
                    child: FadeTransition(
                      opacity: widget.controller,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Lottie.network(
                            "https://lottie.host/fc984e4f-8230-4548-8326-9b9c76c1dbbf/QoBwgOzAnw.json",
                            width: screenWidth,
                            controller: _lottieController,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5, left: 4),
                            child: ClipOval(
                              child: Image.asset(
                                ImagePath.DEV,
                                width: screenWidth * .624,
                                height: screenWidth * .624,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: padding.copyWith(top: 0),
                    width: screenWidth,
                    child: AboutDev(
                      controller: widget.controller,
                      width: screenWidth,
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: textMargin,
                    width: screenWidth * 0.40,
                    child: AboutDev(
                      controller: widget.controller,
                      width: screenWidth * 0.40,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    margin: imageMargin,
                    child: FadeTransition(
                      opacity: widget.controller,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Lottie.network(
                            "https://lottie.host/fc984e4f-8230-4548-8326-9b9c76c1dbbf/QoBwgOzAnw.json",
                            width: screenWidth * 0.35,
                            controller: _lottieController,
                            fit: BoxFit.cover,
                          ),
                          ClipOval(
                            child: Image.asset(
                              ImagePath.DEV,
                              width: screenWidth * 0.27,
                              height: screenWidth * 0.27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
          Positioned(
            right: 0,
            bottom: 0,
            child: ResponsiveBuilder(
              builder: (context, sizingInformation) {
                double screenWidth = sizingInformation.screenSize.width;
                if (screenWidth < RefinedBreakpoints().tabletNormal) {
                  return SizedBox.shrink();
                } else {
                  return InkWell(
                    hoverColor: Colors.transparent,
                    enableFeedback: false,
                    onTap: () {
                      Scrollable.ensureVisible(
                        widget.scrollToWorksKey.currentContext!,
                        duration: kDuration,
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
    );
  }
}

class WhiteCircle extends StatelessWidget {
  const WhiteCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final widthOfCircle = responsiveSize(
      context,
      widthOfScreen(context) / 2.5,
      widthOfScreen(context) / 3.5,
    );
    return Container(
      width: widthOfCircle,
      height: widthOfCircle,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(widthOfCircle / 2),
        ),
      ),
    );
  }
}

class AboutDev extends StatefulWidget {
  const AboutDev({
    super.key,
    required this.controller,
    required this.width,
  });

  final AnimationController controller;
  final double width;

  @override
  State<AboutDev> createState() => _AboutDevState();
}

class _AboutDevState extends State<AboutDev> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    EdgeInsetsGeometry margin = const EdgeInsets.only(left: 16);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double headerFontSize = responsiveSize(context, 28, 48, md: 36, sm: 32);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.HI,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.headlineLarge?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.DEV_INTRO,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.headlineLarge?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: StringConst.DEV_TITLE,
            width: responsiveSize(
              context,
              widget.width * 0.75,
              widget.width,
              md: widget.width,
              sm: widget.width,
            ),
            maxLines: 3,
            textStyle: textTheme.headlineLarge?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
            ),
          ),
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: AnimatedPositionedText(
            controller: curvedAnimation,
            width: widget.width,
            maxLines: 3,
            factor: 2,
            text: StringConst.DEV_DESC,
            textStyle: textTheme.bodyLarge?.copyWith(
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_16,
                Sizes.TEXT_SIZE_18,
              ),
              height: 2,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SpaceH30(),
        AnimatedPositionedWidget(
          controller: curvedAnimation,
          width: 340,
          height: 60,
          child: AnimatedBubbleButton(
            color: AppColors.grey100,
            imageColor: AppColors.black,
            startOffset: Offset(0, 0),
            targetOffset: Offset(0.1, 0),
            targetWidth: 290,
            startBorderRadius: const BorderRadius.all(
              Radius.circular(100.0),
            ),
            title: StringConst.SEE_MY_WORKS.toUpperCase(),
            titleStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
              fontSize: responsiveSize(
                context,
                Sizes.TEXT_SIZE_14,
                Sizes.TEXT_SIZE_16,
                sm: Sizes.TEXT_SIZE_15,
              ),
              fontWeight: FontWeight.w500,
            ),
            onTap: () {
              Navigator.pushNamed(context, Routes.work);
            },
          ),
        ),
        SpaceH40(),
        Container(
          margin: margin,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _buildSocials(
              context: context,
              data: Data.socialData1,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
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
          controller: widget.controller,
          hasSlideBoxAnimation: true,
          hasOffsetAnimation: true,
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
