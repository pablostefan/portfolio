import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/content_builder.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

class ExperienceWidget extends StatefulWidget {
  final ExperienceData data;
  final double width;

  const ExperienceWidget({super.key, required this.data, required this.width});

  @override
  State<ExperienceWidget> createState() => _ExperienceWidgetState();
}

class _ExperienceWidgetState extends State<ExperienceWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  int get _index => Data.experienceData.indexOf(widget.data);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 1200), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_18, Sizes.TEXT_SIZE_20),
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: VisibilityDetectorWidget(
        key: Key('experience-section-${widget.data.company}'),
        minVisible: 40,
        context: context,
        action: _controller.forward,
        child: ContentBuilder(
          controller: _controller,
          number: "/0${_index + 1}",
          width: widget.width,
          section: widget.data.duration.toUpperCase(),
          heading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextSlideBoxWidget(
                controller: _controller,
                text: widget.data.company,
                textStyle: defaultTitleStyle,
              ),
              SpaceH16(),
              TextSlideBoxWidget(
                controller: _controller,
                text: widget.data.position,
                textStyle: defaultTitleStyle?.copyWith(
                  fontSize: context.responsive(Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          body: Column(
            spacing: 20,
            children: List.generate(
              widget.data.roles.length,
              (index) => _RoleWidget(role: widget.data.roles[index], controller: _controller),
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleWidget extends StatelessWidget {
  final String role;
  final AnimationController controller;

  const _RoleWidget({required this.role, required this.controller});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: context.responsive(15, 17),
      color: AppColors.grey750,
      fontWeight: FontWeight.w300,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Icon(Icons.play_arrow_outlined, color: AppColors.black, size: 12),
        ),
        SpaceW12(),
        Expanded(
          child: AnimatedPositionedText(
            text: role,
            textStyle: bodyLargeStyle,
            maxLines: 30,
            width: context.widthOfScreen * .75,
            controller: controller,
          ),
        ),
      ],
    );
  }
}
