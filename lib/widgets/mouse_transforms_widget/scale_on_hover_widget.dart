import 'package:flutter/material.dart';

class ScaleOnHoverWidget extends StatefulWidget {
  final Widget child;
  final double hoverScale;

  const ScaleOnHoverWidget({super.key, required this.child, this.hoverScale = 1.1});

  @override
  State<ScaleOnHoverWidget> createState() => _ScaleOnHoverWidgetState();
}

class _ScaleOnHoverWidgetState extends State<ScaleOnHoverWidget> {
  Matrix4 get _scaleTransform => Matrix4.identity()..scale(widget.hoverScale);

  Matrix4 get _noScaleTransform => Matrix4.identity()..scale(1.0);

  Matrix4 get _transform => _hovering ? _scaleTransform : _noScaleTransform;

  bool _hovering = false;

  void _mouseEnter(bool hover) => setState(() => _hovering = hover);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: AnimatedContainer(
            duration: Durations.medium3, curve: Curves.easeOutCirc, transform: _transform, child: widget.child));
  }
}
