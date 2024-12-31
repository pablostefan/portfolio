import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class PortfolioButton extends StatefulWidget {
  const PortfolioButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.width = Sizes.WIDTH_120,
    this.borderWidth = Sizes.WIDTH_1,
    this.height = Sizes.HEIGHT_44,
    this.onPressed,
    this.hasIcon = true,
    this.iconColor = AppColors.white,
    this.buttonColor = AppColors.black,
    this.borderColor = AppColors.black,
    this.onHoverColor = AppColors.white,
    this.iconData = FontAwesomeIcons.telegram,
    this.iconSize = Sizes.ICON_SIZE_14,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.fastOutSlowIn,
    this.buttonStyle,
    this.isLoading = false,
    this.borderRadius = Sizes.RADIUS_0,
  });

  final String title;
  final TextStyle? titleStyle;
  final IconData iconData;
  final double iconSize;
  final Color iconColor;
  final Color buttonColor;
  final Color borderColor;

  /// this is the color that shows when hovered
  final Color onHoverColor;
  final double width;
  final double borderWidth;
  final double height;
  final ButtonStyle? buttonStyle;
  final VoidCallback? onPressed;
  final Duration duration;
  final Curve curve;
  final bool hasIcon;
  final bool isLoading;
  final double borderRadius;

  @override
  State<PortfolioButton> createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _textAndIconColor;
  late Animation<Offset> _offsetAnimation;
  bool _isHovering = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _textAndIconColor = ColorTween(
      begin: widget.onHoverColor,
      end: widget.buttonColor,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0.5, 0),
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: _textAndIconColor.value,
      fontSize: Sizes.TEXT_SIZE_14,
      fontWeight: FontWeight.w400,
    );
    final ButtonStyle defaultButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: widget.onHoverColor,
      backgroundColor: widget.onHoverColor,
      padding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        side: BorderSide(
          width: 1,
          color: widget.borderColor,
        ),
      ),
    );
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: widget.buttonStyle ?? defaultButtonStyle,
          child: widget.hasIcon
              ? Stack(
                  children: [
                    animatedBackground(),
                    childWithIcon(),
                  ],
                )
              : Stack(
                  children: [
                    animatedBackground(),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: Sizes.PADDING_2),
                        child: Text(
                          widget.title,
                          style: widget.titleStyle ?? style,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget animatedBackground() {
    return Positioned(
      right: 0,
      child: AnimatedContainer(
        duration: widget.duration,
        width: _isHovering ? 0 : widget.width,
        height: widget.height,
        color: widget.buttonColor,
        curve: widget.curve,
      ),
    );
  }

  Widget childWithIcon() {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyLarge?.copyWith(
      color: _textAndIconColor.value,
      fontSize: Sizes.TEXT_SIZE_14,
      fontWeight: FontWeight.w400,
    );
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: widget.titleStyle ?? style,
          ),
          SpaceW8(),
          SlideTransition(
            position: _offsetAnimation,
            child: widget.isLoading
                ? SpinKitWanderingCubes(
                    color: _textAndIconColor.value,
                    size: 16.0,
                  )
                : Icon(
                    widget.iconData,
                    size: widget.iconSize,
                    color: _textAndIconColor.value,
                  ),
          )
        ],
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _controller.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        _controller.reverse();
        _isHovering = hovering;
      });
    }
  }
}
