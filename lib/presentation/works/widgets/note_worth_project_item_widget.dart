import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_line_through_text.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class NoteWorthProjectItemWidget extends StatelessWidget {
  final AnimationController controller;
  final int index;

  const NoteWorthProjectItemWidget({super.key, required this.controller, required this.index});

  NoteWorthyProjectDetails get _data => Data.noteworthyProjects[index];

  @override
  Widget build(BuildContext context) {
    return _NoteWorthyProjectItem(
      controller: controller,
      number: index + 1 > 9 ? "/${index + 1}" : "/0${index + 1}",
      projectName: _data.projectName,
      onSourceTap: () {
        if (_data.isPublic) Functions.launchUrl(_data.gitHubUrl ?? "");
      },
      onProjectNameTap: () {
        if (_data.isLive) {
          final url = _data.isWeb ? _data.webUrl : _data.playStoreUrl;
          if (url != null) Functions.launchUrl(url);
        } else if (_data.isPublic) {
          final gitHubUrl = _data.gitHubUrl;
          if (gitHubUrl != null) Functions.launchUrl(gitHubUrl);
        }
      },
    );
  }
}

class _NoteWorthyProjectItem extends StatelessWidget {
  const _NoteWorthyProjectItem({
    Key? key,
    required this.number,
    required this.projectName,
    required this.controller,
    this.onSourceTap,
    this.onProjectNameTap,
  }) : super(key: key);

  final String number;
  final String projectName;
  final AnimationController controller;
  final GestureTapCallback? onSourceTap;
  final GestureTapCallback? onProjectNameTap;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? defaultNumberStyle = textTheme.labelLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.grey550,
      fontWeight: FontWeight.w400,
    );
    TextStyle? defaultSourceStyle = textTheme.labelLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_16,
      color: AppColors.grey700,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
    );
    TextStyle? defaultProjectNameStyle = textTheme.labelLarge?.copyWith(
      fontSize: context.responsive(
        Sizes.TEXT_SIZE_16,
        Sizes.TEXT_SIZE_20,
        sm: Sizes.TEXT_SIZE_18,
      ),
      color: AppColors.black,
      fontWeight: FontWeight.w500,
    );
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedTextSlideBoxTransition(
          controller: controller,
          text: number,
          textStyle: defaultNumberStyle,
        ),
        SpaceW20(),
        InkWell(
          onTap: onSourceTap,
          hoverColor: Colors.transparent,
          child: AnimatedTextSlideBoxTransition(
            controller: controller,
            text: "<src/>",
            textStyle: defaultSourceStyle,
          ),
        ),
        SpaceW20(),
        Flexible(
          child: AnimatedLineThroughText(
            maxLines: 3,
            width: context.assignWidth(.5),
            hasSlideBoxAnimation: true,
            controller: controller,
            text: projectName,
            onTap: onProjectNameTap,
            textStyle: defaultProjectNameStyle,
            isUnderlinedOnHover: false,
            isUnderlinedByDefault: true,
          ),
        ),
      ],
    );
  }
}
