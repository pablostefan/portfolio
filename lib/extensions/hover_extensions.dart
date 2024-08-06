import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/widgets/mouse_transforms/scale_on_hover_widget.dart';
import 'package:portfolio/widgets/mouse_transforms/translate_on_hover.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover => _returnUnalteredOnMobile(MouseRegion(cursor: SystemMouseCursors.click, child: this));

  Widget moveOnHover({double? x, double? y}) =>
      _returnUnalteredOnMobile(TranslateOnHoverWidget(x: x, y: y, child: this));

  Widget scaleOnHover() => _returnUnalteredOnMobile(ScaleOnHoverWidget(child: this));

  Widget _returnUnalteredOnMobile(Widget alteredWidget) => kIsWeb ? alteredWidget : this;
}
