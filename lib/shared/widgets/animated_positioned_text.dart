import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/functions.dart';

class AnimatedPositionedText extends StatefulWidget {
  final AnimationController controller;
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final Curve slideAnimationCurve;
  final double width;
  final int maxLines;
  final double minVisible;

  const AnimatedPositionedText({
    super.key,
    required this.text,
    required this.textStyle,
    required this.controller,
    this.maxLines = 1,
    this.width = double.infinity,
    this.textAlign,
    this.slideAnimationCurve = Curves.fastOutSlowIn,
    this.minVisible = 40,
  });

  @override
  State<AnimatedPositionedText> createState() => _AnimatedPositionedTextState();
}

class _AnimatedPositionedTextState extends State<AnimatedPositionedText> with SingleTickerProviderStateMixin {
  late Size _size;
  late Animation<RelativeRect> _textPosition;
  late Animation<double> _opacity;
  late double _textHeight;

  @override
  void initState() {
    super.initState();
    _size = Functions.textSize(
      text: widget.text,
      style: widget.textStyle,
      maxWidth: widget.width,
      maxLines: widget.maxLines,
    );

    _textHeight = _size.height * 1.1;

    _textPosition = RelativeRectTween(
      begin: RelativeRect.fromSize(Rect.fromLTWH(0, _textHeight, 0, _textHeight), Size(0, _textHeight)),
      end: RelativeRect.fromSize(Rect.fromLTWH(0, 0, 0, _textHeight), Size(0, _textHeight)),
    ).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );

    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      child: SizedBox(
          width: widget.width,
          child: Text(widget.text, maxLines: widget.maxLines, textAlign: widget.textAlign, style: widget.textStyle)),
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: Offset(0, _textPosition.value.top),
            child: child ?? SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
