import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/empty.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

import 'portfolio_button.dart';

class CertificationCard extends StatefulWidget {
  const CertificationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.actionTitle,
    this.width = 500,
    this.height = 400,
    this.elevation,
    this.shadow,
    this.hoverColor = AppColors.accentColor,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionTitleTextStyle,
    this.duration = 1000,
    this.onTap,
    this.isMobileOrTablet = false,
  });

  final double width;
  final double height;
  final String imageUrl;
  final double? elevation;
  final Shadow? shadow;
  final String title;
  final String subtitle;
  final String actionTitle;
  final Color hoverColor;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionTitleTextStyle;
  final int duration;
  final GestureTapCallback? onTap;
  final bool isMobileOrTablet;

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> with SingleTickerProviderStateMixin {
  late AnimationController _portfolioCoverController;
  late Animation<double> _opacityAnimation;
  final int duration = 200;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _portfolioCoverController = AnimationController(duration: Duration(milliseconds: duration), vsync: this);
    _opacityAnimation = Tween<double>(begin: 0.0, end: .8).animate(
      CurvedAnimation(
        parent: _portfolioCoverController,
        curve: Interval(0.0, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _portfolioCoverController.dispose();
    super.dispose();
  }

  Future<void> _playPortfolioCoverAnimation() async {
    try {
      await _portfolioCoverController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: MouseRegion(
          onEnter: (e) => _mouseEnter(true),
          onExit: (e) => _mouseEnter(false),
          child: Stack(
            children: [
              Image.asset(
                widget.imageUrl,
                opacity: AlwaysStoppedAnimation(_hovering ? 0.3 : 1.0),
                width: widget.width,
                height: widget.height,
                fit: BoxFit.contain,
              ),
              // if it is not a tablet or mobile device, allow on hover effect
              Visibility(
                visible: !widget.isMobileOrTablet && _hovering,
                replacement: Empty(),
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: widget.hoverColor,
                    child: _buildCardInfo(),
                  ),
                ),
              ),
              Visibility(
                visible: widget.isMobileOrTablet,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  color: widget.hoverColor.withOpacity(0.15),
                  child: Column(
                    children: [
                      Spacer(flex: 3),
                      PortfolioButton(
                        height: Sizes.HEIGHT_36,
                        hasIcon: false,
                        width: 90,
                        buttonColor: AppColors.white,
                        borderColor: AppColors.black,
                        onHoverColor: AppColors.black,
                        title: widget.actionTitle.toUpperCase(),
                        onPressed: widget.onTap,
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });

    if (_hovering == true) {
      _playPortfolioCoverAnimation();
    } else if (_hovering == false) {
      _portfolioCoverController.reverse().orCancel;
    }
  }

  Widget _buildCardInfo() {
    ThemeData theme = Theme.of(context);
    return Column(
      children: [
        Spacer(flex: 1),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: widget.titleTextStyle ??
              theme.textTheme.headlineSmall?.copyWith(
                color: AppColors.black,
              ),
        ),
        SpaceH4(),
        Text(
          widget.subtitle,
          textAlign: TextAlign.center,
          style: widget.subtitleTextStyle ??
              theme.textTheme.bodyLarge?.copyWith(
                color: AppColors.black,
                fontSize: Sizes.TEXT_SIZE_16,
              ),
        ),
        SpaceH16(),
        PortfolioButton(
          height: Sizes.HEIGHT_36,
          hasIcon: false,
          width: 90,
          buttonColor: AppColors.white,
          borderColor: AppColors.black,
          onHoverColor: AppColors.black,
          title: widget.actionTitle.toUpperCase(),
          onPressed: widget.onTap,
        ),
        SpaceH4(),
        Spacer(flex: 1),
      ],
    );
  }
}
