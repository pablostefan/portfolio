import 'package:flutter/material.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;
  final double? x;
  final double? y;

  const TranslateOnHover({
    super.key,
    required this.child,
    this.x,
    this.y,
  });

  @override
  State<TranslateOnHover> createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  Matrix4 get _nonHoverTransform => Matrix4.identity()..translate(0, 0, 0);

  Matrix4 get _hoverTransform => Matrix4.identity()..translate(widget.x ?? 0, widget.y ?? 0);

  Matrix4 get _transform => _hovering ? _hoverTransform : _nonHoverTransform;

  bool _hovering = false;

  void _mouseEnter(bool hover) => setState(() => _hovering = hover);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child:
            AnimatedContainer(duration: const Duration(milliseconds: 200), transform: _transform, child: widget.child));
  }
}
