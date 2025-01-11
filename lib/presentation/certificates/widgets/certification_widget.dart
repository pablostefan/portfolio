import 'package:flutter/material.dart';
import 'package:portfolio/presentation/certificates/widgets/desktop_card_info_widget.dart';
import 'package:portfolio/presentation/certificates/widgets/tablet_card_info_widget.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';

class CertificationWidget extends StatefulWidget {
  final CertificationData data;

  const CertificationWidget({super.key, required this.data});

  @override
  State<CertificationWidget> createState() => _CertificationWidgetState();
}

class _CertificationWidgetState extends State<CertificationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: Durations.long4, vsync: this);
    _opacityAnimation = Tween<double>(begin: 0.0, end: .8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(_) {
    setState(() {
      _hovering = true;
      _controller.forward();
    });
  }

  void _onExit(_) {
    setState(() {
      _hovering = false;
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SizedBox(
            width: constraints.maxWidth / 2.2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(_hovering ? 0 : .2),
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
                      opacity: AlwaysStoppedAnimation(_hovering ? .2 : 1),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                AdaptiveBuilderWidget(
                  tabletNormal: TabletCardInfoWidget(data: widget.data),
                  desktop: FadeTransition(
                    opacity: _opacityAnimation,
                    child: DesktopCardInfoWidget(data: widget.data),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
