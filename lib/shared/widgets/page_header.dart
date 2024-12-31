import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_slide_transition.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';

class PageHeader extends StatefulWidget {
  const PageHeader({
    super.key,
    required this.headingText,
    required this.headingTextController,
  });

  final String headingText;
  final AnimationController headingTextController;

  @override
  State<PageHeader> createState() => _PageHeaderState();
}

class _PageHeaderState extends State<PageHeader> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  late AnimationController lottieController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();
    lottieController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
    animation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset(0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? headingStyle = textTheme.headlineLarge?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_40,
        Sizes.TEXT_SIZE_60,
      ),
    );
    return SizedBox(
      width: widthOfScreen(context),
      height: heightOfScreen(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.2,
              child: Lottie.network(
                "https://lottie.host/27454443-4cc3-4ce2-8510-e463a4525f88/wWNg3XvdF2.json",
                controller: lottieController,
                width: 480,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AnimatedTextSlideBoxTransition(
              controller: widget.headingTextController,
              text: widget.headingText,
              textStyle: headingStyle,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: Sizes.MARGIN_40),
              child: AnimatedSlideTransition(
                controller: controller,
                position: animation,
                child: Image.asset(
                  ImagePath.ARROW_DOWN_IOS,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
