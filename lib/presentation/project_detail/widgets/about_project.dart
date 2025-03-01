import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_bubble_button.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_positioned_widget.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/project_item.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

List<String> titles = [
  StringConst.PLATFORM,
  StringConst.CATEGORY,
  StringConst.AUTHOR,
  StringConst.DESIGNER,
  StringConst.TECHNOLOGY_USED,
];

class AboutProject extends StatefulWidget {
  const AboutProject({
    super.key,
    required this.controller,
    required this.projectDataController,
    required this.projectData,
    required this.width,
  });

  final AnimationController controller;
  final AnimationController projectDataController;
  final ProjectItemData projectData;
  final double width;

  @override
  State<AboutProject> createState() => _AboutProjectState();
}

class _AboutProjectState extends State<AboutProject> {
  @override
  void initState() {
    super.initState();

    widget.controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.projectDataController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double googlePlayButtonWidth = 150;

    double targetWidth = context.responsive(118, 150, md: 150);

    double initialWidth = context.responsive(36, 50, md: 50);

    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? bodyTextStyle = textTheme.bodyLarge?.copyWith(
      fontSize: Sizes.TEXT_SIZE_18,
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
    );

    double projectDataWidth = context.responsive(
      widget.width,
      widget.width * 0.55,
      md: widget.width * 0.75,
    );

    double projectDataSpacing = context.responsive(widget.width * 0.1, 48, md: 36);

    double widthOfProjectItem = (projectDataWidth - (projectDataSpacing)) / 2;

    BorderRadiusGeometry borderRadius = BorderRadius.all(Radius.circular(100));

    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16, sm: Sizes.TEXT_SIZE_15),
      fontWeight: FontWeight.w500,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextSlideBoxWidget(
          controller: widget.controller,
          text: StringConst.ABOUT_PROJECT,
          coverColor: AppColors.white,
          width: context.widthOfScreen * 0.7,
          textStyle: textTheme.headlineSmall?.copyWith(fontSize: context.responsive(30, 40)),
        ),
        SpaceH40(),
        AnimatedPositionedText(
          controller: widget.controller,
          width: context.widthOfScreen * 0.7,
          maxLines: 10,
          text: widget.projectData.portfolioDescription,
          textStyle: bodyTextStyle,
        ),
        SpaceH40(),
        SizedBox(
          width: projectDataWidth,
          child: Wrap(
            spacing: projectDataSpacing,
            runSpacing: context.responsive(30, 40),
            children: [
              ProjectData(
                controller: widget.projectDataController,
                width: widthOfProjectItem,
                title: StringConst.PLATFORM,
                subtitle: widget.projectData.platform,
              ),
              ProjectData(
                controller: widget.projectDataController,
                width: widthOfProjectItem,
                title: StringConst.CATEGORY,
                subtitle: widget.projectData.category,
              ),
              ProjectData(
                controller: widget.projectDataController,
                width: widthOfProjectItem,
                title: StringConst.AUTHOR,
                subtitle: StringConst.DEV_NAME,
              ),
              if (widget.projectData.designer != null)
                ProjectData(
                    width: widthOfProjectItem,
                    controller: widget.projectDataController,
                    title: StringConst.DESIGNER,
                    subtitle: widget.projectData.designer ?? ''),
              if (widget.projectData.technologyUsed != null)
                ProjectData(
                    width: widthOfProjectItem,
                    controller: widget.projectDataController,
                    title: StringConst.TECHNOLOGY_USED,
                    subtitle: widget.projectData.technologyUsed ?? ''),
            ],
          ),
        ),
        SpaceH30(),
        Container(),
        Row(
          children: [
            Visibility(
              visible: widget.projectData.isLive && widget.projectData.webUrl.isNotEmpty,
              child: AnimatedPositionedWidget(
                controller: CurvedAnimation(
                  parent: widget.projectDataController,
                  curve: Animations.textSlideInCurve,
                ),
                width: targetWidth,
                height: initialWidth,
                child: AnimatedBubbleButton(
                  title: StringConst.LAUNCH_WEB,
                  color: AppColors.grey100,
                  imageColor: AppColors.black,
                  startBorderRadius: borderRadius,
                  startWidth: initialWidth,
                  height: initialWidth,
                  targetWidth: targetWidth,
                  titleStyle: buttonStyle,
                  onTap: () {
                    Functions.launchUrl(widget.projectData.webUrl);
                  },
                  startOffset: Offset(0, 0),
                  targetOffset: Offset(0.1, 0),
                ),
              ),
            ),
            Visibility(visible: widget.projectData.isLive, child: Spacer()),
            Visibility(
              visible: widget.projectData.isPublic && widget.projectData.gitHubUrl.isNotEmpty,
              child: AnimatedPositionedWidget(
                controller: CurvedAnimation(
                  parent: widget.projectDataController,
                  curve: Animations.textSlideInCurve,
                ),
                width: targetWidth,
                height: initialWidth,
                child: AnimatedBubbleButton(
                  title: StringConst.SOURCE_CODE,
                  color: AppColors.grey100,
                  imageColor: AppColors.black,
                  startBorderRadius: borderRadius,
                  startWidth: initialWidth,
                  height: initialWidth,
                  targetWidth: targetWidth,
                  titleStyle: buttonStyle,
                  startOffset: Offset(0, 0),
                  targetOffset: Offset(0.1, 0),
                  onTap: () => Functions.launchUrl(widget.projectData.gitHubUrl),
                ),
              ),
            ),
          ],
        ),
        Visibility(visible: widget.projectData.isOnPlayStore, child: SpaceH80()),
        Visibility(
          visible: widget.projectData.isOnPlayStore,
          child: TextSlideBoxWidget(
            controller: widget.controller,
            text: StringConst.IN_STORE,
            coverColor: AppColors.white,
            maxLines: 4,
            width: context.widthOfScreen * 0.7,
            textStyle: textTheme.headlineSmall?.copyWith(fontSize: context.responsive(30, 40)),
          ),
        ),
        Visibility(visible: widget.projectData.isOnPlayStore, child: SpaceH30()),
        Visibility(
          visible: widget.projectData.isOnPlayStore,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Functions.launchUrl(widget.projectData.playStoreUrl);
                  },
                  child: AnimatedPositionedWidget(
                    controller: CurvedAnimation(
                      parent: widget.projectDataController,
                      curve: Animations.textSlideInCurve,
                    ),
                    width: googlePlayButtonWidth,
                    height: 50,
                    child: Image.asset(
                      ImagePath.GOOGLE_PLAY,
                      width: googlePlayButtonWidth,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: InkWell(
                    onTap: () {
                      Functions.launchUrl(widget.projectData.appStoreUrl);
                    },
                    child: AnimatedPositionedWidget(
                      controller: CurvedAnimation(
                        parent: widget.projectDataController,
                        curve: Animations.textSlideInCurve,
                      ),
                      width: googlePlayButtonWidth,
                      height: 50,
                      child: Image.asset(
                        ImagePath.APP_STORE,
                        width: googlePlayButtonWidth,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
    this.width = double.infinity,
    this.titleStyle,
    this.subtitleStyle,
  });

  final String title;
  final String subtitle;
  final double width;
  final AnimationController controller;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    TextStyle? defaultTitleStyle = textTheme.labelLarge?.copyWith(
      color: AppColors.black,
      fontSize: 17,
    );
    TextStyle? defaultSubtitleStyle = textTheme.bodyLarge?.copyWith(
      fontSize: 15,
    );

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextSlideBoxWidget(
            width: width,
            maxLines: 2,
            coverColor: AppColors.white,
            controller: controller,
            text: title,
            textStyle: titleStyle ?? defaultTitleStyle,
          ),
          SpaceH12(),
          AnimatedPositionedText(
            width: width,
            maxLines: 2,
            controller: controller,
            text: subtitle,
            textStyle: subtitleStyle ?? defaultSubtitleStyle,
          ),
        ],
      ),
    );
  }
}
