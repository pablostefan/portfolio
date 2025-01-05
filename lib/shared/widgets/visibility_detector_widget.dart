import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VisibilityDetectorWidget extends VisibilityDetector {
  final VoidCallback action;
  final BuildContext context;
  final double minVisible;

  VisibilityDetectorWidget({
    required super.key,
    required super.child,
    required this.action,
    required this.context,
    required this.minVisible,
  }) : super(
            onVisibilityChanged: (info) => _onVisibilityChanged(
                  visibilityInfo: info,
                  context: context,
                  minSize: minVisible,
                  action: action,
                ));

  static void _onVisibilityChanged({
    required VisibilityInfo visibilityInfo,
    required BuildContext context,
    required double minSize,
    required VoidCallback action,
  }) {
    double percentage = visibilityInfo.visibleFraction * 100;
    if (percentage > minSize && context.mounted) action.call();
  }
}
