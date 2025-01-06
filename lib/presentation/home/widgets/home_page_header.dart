import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/home/widgets/scroll_down.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_bubble_button.dart';
import 'package:portfolio/shared/widgets/animated_line_through_text.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_positioned_widget.dart';
import 'package:portfolio/shared/widgets/animated_slide_transition.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/socials.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

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
      duration: const Duration(seconds: 22),
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
    return Container(
      width: context.widthOfScreen,
      color: AppColors.accentColor2.withOpacity(0.35),
      child: Stack(
        children: [
          AdaptiveBuilderWidget(
            tabletNormal: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: context.widthOfScreen * 0.1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Lottie.network(
                        ImagePath.HOME_LOTTIE,
                        width: context.widthOfScreen,
                        controller: _lottieController,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: context.widthOfScreen * .5,
                        height: context.widthOfScreen * .5,
                        decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: context.widthOfScreen * .06, left: 3),
                        child: ClipOval(
                          child: Image.asset(
                            ImagePath.DEV,
                            width: context.widthOfScreen * .57,
                            height: context.widthOfScreen * .57,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: context.widthOfScreen * 0.1),
                  width: context.widthOfScreen,
                  child: AboutDev(
                    controller: widget.controller,
                    width: context.widthOfScreen,
                  ),
                ),
              ],
            ),
            desktop: SizedBox(
              height: context.heightOfScreen,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: context.widthOfScreen * .08),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AboutDev(
                        controller: widget.controller,
                        width: context.widthOfScreen,
                      ),
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: FadeTransition(
                      opacity: widget.controller,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Lottie.network(
                            ImagePath.HOME_LOTTIE,
                            width: context.widthOfScreen * .36,
                            controller: _lottieController,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: context.widthOfScreen * .24,
                            height: context.widthOfScreen * .24,
                            decoration: BoxDecoration(color: AppColors.grey, shape: BoxShape.circle),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: context.widthOfScreen * .03, left: 3),
                            child: ClipOval(
                              child: Image.asset(
                                ImagePath.DEV,
                                width: context.widthOfScreen * .26,
                                height: context.widthOfScreen * .25,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: AdaptiveBuilderWidget(
              desktop: InkWell(
                hoverColor: Colors.transparent,
                enableFeedback: false,
                onTap: () {
                  Scrollable.ensureVisible(
                    widget.scrollToWorksKey.currentContext!,
                    duration: kDuration,
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: context.responsive(6, 24), bottom: 40),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: margin,
          child: TextSlideBoxWidget(
            controller: widget.controller,
            text: StringConst.HI,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.headlineLarge?.copyWith(
              color: AppColors.black,
              fontSize: context.responsive(28, 48, md: 36, sm: 32),
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: TextSlideBoxWidget(
            controller: widget.controller,
            text: StringConst.DEV_INTRO,
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.headlineLarge?.copyWith(
              color: AppColors.black,
              fontSize: context.responsive(28, 48, md: 36, sm: 32),
            ),
          ),
        ),
        SpaceH12(),
        Container(
          margin: margin,
          child: TextSlideBoxWidget(
            controller: widget.controller,
            text: StringConst.DEV_TITLE,
            width: context.responsive(
              widget.width * 0.75,
              widget.width,
              md: widget.width,
              sm: widget.width,
            ),
            maxLines: 3,
            textStyle: textTheme.headlineLarge?.copyWith(
              color: AppColors.black,
              fontSize: context.responsive(28, 48, md: 36, sm: 32),
            ),
          ),
        ),
        SpaceH30(),
        Container(
          margin: margin,
          child: AnimatedPositionedText(
            controller: widget.controller,
            width: widget.width,
            maxLines: 3,
            text: StringConst.DEV_DESC,
            textStyle: textTheme.bodyLarge?.copyWith(
              fontSize: context.responsive(Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18),
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
            startBorderRadius: BorderRadius.circular(100),
            title: StringConst.SEE_MY_WORKS.toUpperCase(),
            titleStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
              fontSize: context.responsive(
                Sizes.TEXT_SIZE_14,
                Sizes.TEXT_SIZE_16,
                sm: Sizes.TEXT_SIZE_15,
              ),
              fontWeight: FontWeight.w500,
            ),
            onTap: () => context.go(Routes.work),
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
          onTap: () => Functions.launchUrl(data[index].url),
          textStyle: style,
        ),
      );

      if (index < data.length - 1) items.add(Text('/', style: slashStyle));
    }

    return items;
  }
}
