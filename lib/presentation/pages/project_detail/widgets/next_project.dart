import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/presentation/widgets/animated_bubble_button.dart';
import 'package:portfolio/presentation/widgets/project_item.dart';
import 'package:portfolio/presentation/widgets/spaces.dart';
import 'package:portfolio/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NextProject extends StatefulWidget {
  const NextProject({
    super.key,
    required this.width,
    required this.nextProject,
    this.navigateToNextProject,
  });

  final ProjectItemData nextProject;
  final double width;
  final VoidCallback? navigateToNextProject;

  @override
  State<NextProject> createState() => _NextProjectState();
}

class _NextProjectState extends State<NextProject> with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Animations.switcherDuration,
    );
    scaleAnimation = Tween(begin: 0.90, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _isHovering = hovering;
        controller.forward();
      });
    } else {
      setState(() {
        _isHovering = hovering;
        controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    final EdgeInsetsGeometry marginLeft = EdgeInsets.only(left: 16);
    double projectTitleFontSize = responsiveSize(context, 28, 48, md: 40, sm: 36);
    BorderRadiusGeometry borderRadius = BorderRadius.all(Radius.circular(100.0));
    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(
        context,
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_16,
        sm: Sizes.TEXT_SIZE_15,
      ),
      fontWeight: FontWeight.w500,
    );
    TextStyle? projectTitleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: projectTitleFontSize,
    );
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        double screenWidth = sizingInformation.screenSize.width;

        return Visibility(
            visible: screenWidth <= RefinedBreakpoints().tabletSmall,
            replacement: SizedBox(
              height: assignHeight(context, 0.3),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MouseRegion(
                    onEnter: (e) => _mouseEnter(true),
                    onExit: (e) => _mouseEnter(false),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          margin: marginLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                StringConst.NEXT_PROJECT,
                                style: textTheme.bodyLarge?.copyWith(
                                  fontSize: responsiveSize(
                                    context,
                                    11,
                                    Sizes.TEXT_SIZE_12,
                                  ),
                                  letterSpacing: 2,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SpaceH20(),
                              Visibility(
                                  visible: isDisplayMobileOrTablet(context),
                                  replacement: AnimatedSwitcher(
                                    duration: Animations.switcherDuration,
                                    child: Opacity(
                                      opacity: _isHovering ? 1.0 : 0.2,
                                      child: Text(
                                        widget.nextProject.title,
                                        textAlign: TextAlign.center,
                                        style: projectTitleStyle,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    widget.nextProject.title,
                                    textAlign: TextAlign.center,
                                    style: projectTitleStyle,
                                  ))
                            ],
                          ),
                        ),
                        SpaceH20(),
                        AnimatedBubbleButton(
                          title: StringConst.VIEW_PROJECT,
                          color: AppColors.grey100,
                          imageColor: AppColors.black,
                          startBorderRadius: borderRadius,
                          titleStyle: buttonStyle,
                          startOffset: Offset(0, 0),
                          targetOffset: Offset(0.1, 0),
                          onTap: () {
                            if (widget.navigateToNextProject != null) {
                              widget.navigateToNextProject!();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: widget.width * 0.15),
                  Expanded(
                    child: SizedBox(
                      width: widget.width * 0.55,
                      child: ScaleTransition(
                        scale: scaleAnimation,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            widget.nextProject.coverUrl,
                            fit: BoxFit.fitWidth,
                            color: _isHovering ? Colors.transparent : Colors.grey,
                            colorBlendMode: _isHovering ? BlendMode.color : BlendMode.saturation,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConst.NEXT_PROJECT,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: responsiveSize(context, 11, Sizes.TEXT_SIZE_12),
                    letterSpacing: 2,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SpaceH20(),
                Text(
                  widget.nextProject.title,
                  textAlign: TextAlign.center,
                  style: projectTitleStyle,
                ),
                SpaceH20(),
                SizedBox(
                  width: widthOfScreen(context),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.nextProject.coverUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SpaceH30(),
                AnimatedBubbleButton(
                  title: StringConst.VIEW_PROJECT,
                  color: AppColors.grey100,
                  imageColor: AppColors.black,
                  startBorderRadius: borderRadius,
                  titleStyle: buttonStyle,
                  startOffset: Offset(0, 0),
                  targetOffset: Offset(0.1, 0),
                  onTap: () {
                    if (widget.navigateToNextProject != null) {
                      widget.navigateToNextProject!();
                    }
                  },
                ),
              ],
            ));
      },
    );
  }
}
