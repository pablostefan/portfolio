import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/core/layout/extensions.dart';
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
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<Offset>(
      begin: Offset(0, .5),
      end: Offset(0, -.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? headingStyle = textTheme.headlineLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_40, Sizes.TEXT_SIZE_60),
    );

    return SizedBox(
      width: context.widthOfScreen,
      height: context.heightOfScreen,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 0.2,
              child: Lottie.network(
                ImagePath.CERTIFICATION_LOTTIE,
                filterQuality: FilterQuality.low,
                animate: true,
                repeat: true,
                frameRate: FrameRate.composition,
                width: 480,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextSlideBoxWidget(
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
                controller: _controller,
                position: _animation,
                child: Image.asset(ImagePath.ARROW_DOWN_IOS),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
