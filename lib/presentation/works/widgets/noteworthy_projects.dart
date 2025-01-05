import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/presentation/works/widgets/note_worth_project_item_widget.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/spaces.dart';
import 'package:portfolio/shared/widgets/visibility_detector_widget.dart';

class NoteWorthyProjects extends StatefulWidget {
  const NoteWorthyProjects({super.key});

  @override
  State<NoteWorthyProjects> createState() => _NoteWorthyProjectsState();
}

class _NoteWorthyProjectsState extends State<NoteWorthyProjects> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? titleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_20, Sizes.TEXT_SIZE_30),
    );

    TextStyle? bodyLargeStyle = textTheme.bodyLarge?.copyWith(
      fontSize: context.responsive(Sizes.TEXT_SIZE_16, Sizes.TEXT_SIZE_18),
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      height: 2.0,
    );

    return VisibilityDetectorWidget(
      key: Key('noteworthy-projects'),
      context: context,
      minVisible: 25,
      action: _controller.forward,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextSlideBoxTransition(
            heightFactor: 1.5,
            controller: _controller,
            text: StringConst.NOTE_WORTHY_PROJECTS,
            textStyle: titleStyle,
          ),
          SpaceH16(),
          AnimatedPositionedText(
            controller: CurvedAnimation(
              parent: _controller,
              curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
            ),
            text: StringConst.NOTE_WORTHY_PROJECTS_DESC,
            textStyle: bodyLargeStyle,
          ),
          SpaceH40(),
          Column(
            spacing: 40,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              Data.noteworthyProjects.length,
              (index) => NoteWorthProjectItemWidget(controller: _controller, index: index),
            ),
          ),
        ],
      ),
    );
  }
}
