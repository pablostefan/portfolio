import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';

const double lineHeight = 2;
Color defaultLineColor = AppColors.accentColor2.withOpacity(0.35);

class LoadingHomePageAnimation extends StatefulWidget {
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
  late Animation<double> _containerAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _fadeAnimation;
  late Color lineColor;
  final Duration _scaleDuration = Duration(milliseconds: 400);
  final Duration _leftRightContainerDuration = Duration(milliseconds: 300);
  final Duration _containerDuration = Duration(milliseconds: 600);
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
    _scaleAnimation = Tween<double>(begin: 0.9, end: 0.5).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleOpacityController,
        curve: Curves.easeIn,
      ),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _fadeOutController,
        curve: Curves.easeIn,
      ),
    );
    _containerAnimation = Tween<double>(begin: 0, end: textWidth).animate(
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
        setState(() {});
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
    double screenWidth = context.widthOfScreen;
    double screenHeight = context.heightOfScreen;
    double halfHeightOfScreen = screenHeight / 2;

    return Visibility(
      visible: !_isAnimationOver,
      child: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Stack(
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
            Center(
              child: SizedBox(
                width: textWidth,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: AnimatedBuilder(
                    animation: _scaleOpacityController,
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: widget.style,
                    ),
                    builder: (context, child) => Transform.scale(
                      scale: 2 * _scaleAnimation.value,
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
                        opacity: _opacityAnimation.value,
                        duration: _scaleDuration,
                        child: child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _fadeOutController.isAnimating,
              child: Center(
                child: AnimatedBuilder(
                  animation: _fadeOutController,
                  builder: (context, child) => Container(
                    margin: EdgeInsets.only(top: 40),
                    height: lineHeight,
                    width: Tween<double>(begin: textWidth, end: context.widthOfScreen)
                        .animate(CurvedAnimation(parent: _fadeOutController, curve: Curves.easeIn))
                        .value,
                    color: lineColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _containerController.isAnimating,
              child: Center(
                child: AnimatedBuilder(
                  animation: _containerController,
                  builder: (context, child) => Container(
                    margin: EdgeInsets.only(top: 40),
                    height: lineHeight,
                    width: _containerAnimation.value,
                    color: lineColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
