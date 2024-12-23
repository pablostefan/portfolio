import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/presentation/widgets/empty.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';

const double lineHeight = 2;
Color defaultLineColor = AppColors.accentColor2.withOpacity(0.35);

class LoadingHomePageAnimation extends StatefulWidget {
  static const String loadingPageRoute = StringConst.LOADING_PAGE;

  const LoadingHomePageAnimation({
    super.key,
    required this.text,
    required this.style,
    required this.onLoadingDone,
    this.lineColor,
  });

  final String text;
  final TextStyle? style;
  final VoidCallback onLoadingDone;
  final Color? lineColor;

  @override
  State<LoadingHomePageAnimation> createState() => _LoadingHomePageAnimationState();
}

class _LoadingHomePageAnimationState extends State<LoadingHomePageAnimation> with TickerProviderStateMixin {
  late AnimationController _fadeOutController;
  late AnimationController _containerController;
  late AnimationController _scaleOpacityController;
  late Animation<double> containerAnimation;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  late Animation<double> fadeAnimation;
  late Color lineColor;
  final Duration _scaleDuration = Duration(milliseconds: 750);
  final Duration _leftRightContainerDuration = Duration(milliseconds: 750);
  final Duration _containerDuration = Duration(milliseconds: 2000);
  bool _leftRightAnimationStarted = false;
  bool _leftRightAnimationDone = false;
  bool _isAnimationOver = false;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  void initState() {
    super.initState();
    setTextWidthAndHeight();
    lineColor = widget.lineColor ?? defaultLineColor;
    _scaleOpacityController = AnimationController(
      vsync: this,
      duration: _scaleDuration,
    );
    _containerController = AnimationController(
      vsync: this,
      duration: _containerDuration,
    );
    _fadeOutController = AnimationController(
      vsync: this,
      duration: _leftRightContainerDuration,
    );
    scaleAnimation = Tween<double>(begin: 0.9, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.easeIn,
      ),
    );
    fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeOutController,
        curve: Curves.easeIn,
      ),
    );
    containerAnimation = Tween<double>(begin: 0, end: textWidth).animate(
      CurvedAnimation(
        parent: _containerController,
        curve: Curves.ease,
      ),
    );
    _scaleOpacityController.forward();
    _scaleOpacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _containerController.forward();
        setState(() {});
      }
    });
    _containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        _fadeOutController.forward();
        setState(() => _leftRightAnimationStarted = true);
      }
    });

    _fadeOutController.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() => _leftRightAnimationDone = true);
      }
    });
  }

  @override
  void dispose() {
    _fadeOutController.dispose();
    _scaleOpacityController.dispose();
    _containerController.dispose();
    super.dispose();
  }

  void setTextWidthAndHeight() {
    size = Functions.textSize(text: widget.text, style: widget.style);
    textWidth = size.width;
    textHeight = size.height;
  }

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();
    double screenWidth = widthOfScreen(context);
    double screenHeight = heightOfScreen(context);
    double halfHeightOfScreen = screenHeight / 2;
    double widthOfLeftLine = assignWidth(context, 0.5) - (textWidth / 2);
    double widthOfRightLine = screenWidth - (widthOfLeftLine + textWidth);
    double leftContainerStart = (screenWidth / 2) - (textWidth / 2);

    return _isAnimationOver
        ? Empty()
        : Stack(
            children: [
              AnimatedContainer(
                width: screenWidth,
                height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
                duration: _scaleDuration,
                color: AppColors.black,
                onEnd: () {
                  widget.onLoadingDone();
                  if (mounted) setState(() => _isAnimationOver = true);
                },
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  width: screenWidth,
                  height: _leftRightAnimationDone ? 0 : halfHeightOfScreen,
                  duration: _scaleDuration,
                  color: AppColors.black,
                ),
              ),
              SizedBox(
                width: widthOfScreen(context),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          SizedBox(
                            width: textWidth,
                            child: FadeTransition(
                              opacity: fadeAnimation,
                              child: AnimatedBuilder(
                                animation: _scaleOpacityController,
                                child: Text(
                                  widget.text,
                                  textAlign: TextAlign.center,
                                  style: widget.style,
                                ),
                                builder: (context, child) => Transform.scale(
                                  scale: 2 * scaleAnimation.value,
                                  alignment: Alignment.center,
                                  child: AnimatedOpacity(
                                    opacity: opacityAnimation.value,
                                    duration: _scaleDuration,
                                    child: child,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                      SpaceH20(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widthOfLeftLine,
                            child: Stack(
                              children: [
                                Visibility(
                                  visible: _fadeOutController.isAnimating,
                                  child: Container(
                                    width: widthOfLeftLine,
                                    height: lineHeight,
                                    color: lineColor,
                                  ),
                                ),
                                Positioned(
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted ? 0 : leftContainerStart,
                                    height: lineHeight,
                                    color: AppColors.black,
                                    duration: _leftRightContainerDuration,
                                    // curve: Curves.ease,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          containerAnimationBuilder(
                            controller: _containerController,
                            animation: containerAnimation,
                            color: lineColor,
                          ),
                          SizedBox(
                            width: widthOfRightLine,
                            child: Stack(
                              children: [
                                Visibility(
                                  visible: _fadeOutController.isAnimating,
                                  child: Container(
                                    width: widthOfRightLine,
                                    height: lineHeight,
                                    color: lineColor,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: AnimatedContainer(
                                    width: _leftRightAnimationStarted ? 0 : widthOfRightLine,
                                    height: lineHeight,
                                    color: AppColors.black,
                                    duration: _leftRightContainerDuration,
                                    onEnd: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
  }

  Widget containerAnimationBuilder({
    required Animation<double> animation,
    required AnimationController controller,
    Color color = AppColors.white,
  }) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Container(
        height: lineHeight,
        width: animation.value,
        color: color,
      ),
    );
  }
}
