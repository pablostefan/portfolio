import 'package:flutter/material.dart';
import 'package:portfolio/presentation/certificates/widgets/desktop_card_info_widget.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopCertificationWidget extends StatefulWidget {
  final CertificationData data;

  const DesktopCertificationWidget({super.key, required this.data});

  @override
  State<DesktopCertificationWidget> createState() => _DesktopCertificationWidgetState();
}

class _DesktopCertificationWidgetState extends State<DesktopCertificationWidget> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _fadeController;

  ValueNotifier<bool> _hoveringNotifier = ValueNotifier<bool>(false);

  bool _hasAnimate = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(lowerBound: .02, duration: Durations.extralong4, vsync: this);
    _controller = AnimationController(duration: Durations.long2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  void _onEnter(_) {
    _hoveringNotifier.value = true;
    _controller.forward();
  }

  void _onExit(_) {
    _hoveringNotifier.value = false;
    _controller.reverse();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction >= .6 && !_hasAnimate && mounted) {
      _fadeController.forward();
      _hasAnimate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: VisibilityDetector(
        key: UniqueKey(),
        onVisibilityChanged: _onVisibilityChanged,
        child: AnimatedBuilder(
          animation: _fadeController,
          builder: (_, child) => Opacity(opacity: _fadeController.value, child: child),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SizedBox(
                width: constraints.maxWidth / 2.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: _hoveringNotifier,
                      builder: (_, hovering, __) {
                        return AnimatedOpacity(
                          opacity: hovering ? 0.2 : 1.0,
                          duration: Durations.long2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.2),
                                  blurRadius: 20,
                                  offset: const Offset(0, 10),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                widget.data.image,
                                filterQuality: FilterQuality.low,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) => Opacity(opacity: _controller.value, child: child),
                        child: DesktopCardInfoWidget(data: widget.data)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
