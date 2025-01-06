import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_slide_box.dart';

class TextSlideBoxWidget extends StatefulWidget {
  final AnimationController controller;
  final Color boxColor;
  final Color coverColor;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;
  final Animation<Offset>? position;
  final Curve visibleAnimationCurve;
  final Curve invisibleAnimationCurve;
  final Curve slideAnimationCurve;
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double width;
  final int maxLines;

  const TextSlideBoxWidget({
    super.key,
    required this.controller,
    required this.text,
    required this.textStyle,
    this.width = double.infinity,
    this.maxLines = 1,
    this.visibleBoxAnimation,
    this.invisibleBoxAnimation,
    this.position,
    this.textAlign,
    this.boxColor = AppColors.black,
    this.coverColor = AppColors.primaryColor,
    this.visibleAnimationCurve = Curves.fastOutSlowIn,
    this.invisibleAnimationCurve = Curves.fastOutSlowIn,
    this.slideAnimationCurve = Curves.fastOutSlowIn,
  });

  @override
  State<TextSlideBoxWidget> createState() => _TextSlideBoxWidgetState();
}

class _TextSlideBoxWidgetState extends State<TextSlideBoxWidget> with SingleTickerProviderStateMixin {
  late Animation<double> _visibleAnimation;
  late Animation<double> _invisibleAnimation;
  late Size _size;

  @override
  void initState() {
    super.initState();

    _size = Functions.textSize(
      text: widget.text,
      style: widget.textStyle,
      maxWidth: widget.width,
      maxLines: widget.maxLines,
    );

    _visibleAnimation = widget.visibleBoxAnimation ??
        Tween<double>(begin: 0, end: _size.width).animate(
          CurvedAnimation(
            parent: widget.controller,
            curve: Interval(
              0,
              0.35,
              curve: widget.visibleAnimationCurve,
            ),
          ),
        );

    _invisibleAnimation = widget.invisibleBoxAnimation ??
        Tween<double>(begin: 0, end: _size.width).animate(
          CurvedAnimation(
            parent: widget.controller,
            curve: Interval(
              0.35,
              0.7,
              curve: widget.invisibleAnimationCurve,
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    _size = Functions.textSize(
      text: widget.text,
      style: widget.textStyle,
      maxWidth: widget.width,
      maxLines: widget.maxLines,
    );
    return SizedBox(
      height: _size.height,
      child: Stack(
        children: [
          AnimatedSlideBox(
            controller: widget.controller,
            height: _size.height,
            width: _size.width,
            coverColor: widget.coverColor,
            boxColor: widget.boxColor,
            visibleBoxAnimation: _visibleAnimation,
            invisibleBoxAnimation: _invisibleAnimation,
          ),
          AnimatedPositionedText(
            text: widget.text,
            controller: widget.controller,
            maxLines: widget.maxLines,
            textAlign: widget.textAlign,
            textStyle: widget.textStyle,
            width: _size.width,
          )
        ],
      ),
    );
  }
}
