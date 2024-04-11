import 'package:flutter/material.dart';

class ScaleOnHover extends StatefulWidget {
  final Widget child;
  const ScaleOnHover({super.key, required this.child});

  @override
  State<ScaleOnHover> createState() => _ScaleOnHoverState();
}

class _ScaleOnHoverState extends State<ScaleOnHover> {
  Matrix4 get _scaleTransform => Matrix4.identity()..scale(1.1);
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
