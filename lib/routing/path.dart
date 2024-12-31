import 'package:flutter/material.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext context, Map<String, String>? params);

class RoutePath {
  final String pattern;

  final PathWidgetBuilder builder;

  const RoutePath(this.pattern, this.builder);
}
