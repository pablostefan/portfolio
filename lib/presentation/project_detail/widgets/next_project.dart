import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/adaptive_builder_widget.dart';
import 'package:portfolio/shared/widgets/animated_bubble_button.dart';
import 'package:portfolio/shared/widgets/project_item.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class NextProject extends StatefulWidget {
  const NextProject({
    super.key,
    required this.width,
    this.nextProject,
    this.navigateToNextProject,
  });

  final ProjectItemData? nextProject;
  final double width;
  final VoidCallback? navigateToNextProject;

  @override
  State<NextProject> createState() => _NextProjectState();
}

class _NextProjectState extends State<NextProject> with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: Animations.switcherDuration,
    );
    _scaleAnimation = Tween(begin: .9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool hovering) {
    setState(() {
      _isHovering = hovering;
      hovering ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveBuilderWidget(
      desktop: _buildDesktopLayout(context),
      tabletSmall: _buildTabletLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final double projectTitleFontSize = context.responsive(28, 48, md: 40, sm: 36);

    return SizedBox(
      height: context.assignHeight(0.3),
      child: Row(
        children: [
          _buildProjectDetails(
            context,
            projectTitleFontSize: projectTitleFontSize,
            textTheme: textTheme,
          ),
          SizedBox(width: widget.width * 0.15),
          _buildProjectImage(),
        ],
      ),
    );
  }

  Widget _buildProjectDetails(
    BuildContext context, {
    required double projectTitleFontSize,
    required TextTheme textTheme,
  }) {
    final TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16, sm: Sizes.TEXT_SIZE_15),
      fontWeight: FontWeight.w500,
    );

    final TextStyle? projectTitleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: projectTitleFontSize,
    );

    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNextProjectText(context, textTheme),
          const SpaceH20(),
          _buildProjectTitle(projectTitleStyle),
          const SpaceH20(),
          AnimatedBubbleButton(
            title: StringConst.VIEW_PROJECT,
            color: AppColors.grey100,
            imageColor: AppColors.black,
            startBorderRadius: BorderRadius.circular(100),
            titleStyle: buttonStyle,
            startOffset: const Offset(0, 0),
            targetOffset: const Offset(0.1, 0),
            onTap: widget.navigateToNextProject,
          ),
        ],
      ),
    );
  }

  Widget _buildNextProjectText(BuildContext context, TextTheme textTheme) {
    return Text(
      StringConst.NEXT_PROJECT,
      style: textTheme.bodyLarge?.copyWith(
        fontSize: context.responsive(11, Sizes.TEXT_SIZE_12),
        letterSpacing: 2,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget _buildProjectTitle(TextStyle? projectTitleStyle) {
    return AnimatedSwitcher(
      duration: Animations.switcherDuration,
      child: Opacity(
        opacity: _isHovering ? 1.0 : 0.2,
        child: Text(
          widget.nextProject?.title ?? "",
          textAlign: TextAlign.center,
          style: projectTitleStyle,
        ),
      ),
    );
  }

  Widget _buildProjectImage() {
    return Expanded(
      child: SizedBox(
        width: widget.width * 0.55,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Hero(
            tag: widget.nextProject?.title ?? "",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                widget.nextProject?.coverUrl ?? "",
                fit: BoxFit.fitWidth,
                color: _isHovering ? Colors.transparent : Colors.grey,
                colorBlendMode: _isHovering ? BlendMode.color : BlendMode.saturation,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final double projectTitleFontSize = context.responsive(28, 48, md: 40, sm: 36);

    final TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16, sm: Sizes.TEXT_SIZE_15),
      fontWeight: FontWeight.w500,
    );

    final TextStyle? projectTitleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: projectTitleFontSize,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNextProjectText(context, textTheme),
        const SpaceH20(),
        Text(
          widget.nextProject?.title ?? "",
          textAlign: TextAlign.center,
          style: projectTitleStyle,
        ),
        const SpaceH20(),
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            widget.nextProject?.coverUrl ?? "",
            fit: BoxFit.fitWidth,
          ),
        ),
        const SpaceH30(),
        AnimatedBubbleButton(
          title: StringConst.VIEW_PROJECT,
          color: AppColors.grey100,
          imageColor: AppColors.black,
          startBorderRadius: BorderRadius.circular(100),
          titleStyle: buttonStyle,
          startOffset: const Offset(0, 0),
          targetOffset: const Offset(0.1, 0),
          onTap: widget.navigateToNextProject,
        ),
      ],
    );
  }
}
