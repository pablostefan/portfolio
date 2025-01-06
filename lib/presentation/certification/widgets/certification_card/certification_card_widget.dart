import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/certification/widgets/certification_card/desktop_card_info_widget.dart';
import 'package:portfolio/presentation/certification/widgets/certification_card/tablet_card_info_widget.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';

class CertificationCardWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final String actionTitle;
  final String imageUrl;
  final GestureTapCallback? onTap;

  const CertificationCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.actionTitle,
    required this.imageUrl,
    this.onTap,
  });

  @override
  State<CertificationCardWidget> createState() => _CertificationCardWidgetState();
}

class _CertificationCardWidgetState extends State<CertificationCardWidget> with SingleTickerProviderStateMixin {
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
            width: context.responsive(constraints.maxWidth - 40, (constraints.maxWidth - 60) / 2),
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
                      widget.imageUrl,
                      filterQuality: FilterQuality.low,
                      opacity: AlwaysStoppedAnimation(_hovering ? .2 : 1),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                AdaptiveBuilderWidget(
                  tabletNormal: TabletCardInfoWidget(actionTitle: widget.actionTitle, onTap: widget.onTap),
                  desktop: FadeTransition(
                    opacity: _opacityAnimation,
                    child: DesktopCardInfoWidget(
                      title: widget.title,
                      subtitle: widget.subtitle,
                      actionTitle: widget.actionTitle,
                      onTap: widget.onTap,
                    ),
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
