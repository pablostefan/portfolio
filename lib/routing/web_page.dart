import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WebPage extends CustomTransitionPage {
  WebPage({required super.key, required super.child})
      : super(
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
