import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_bubble_button.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class ProjectItemData {
  ProjectItemData({
    required this.title,
    required this.image,
    required this.coverUrl,
    required this.subtitle,
    required this.portfolioDescription,
    required this.platform,
    required this.primaryColor,
    required this.category,
    this.designer,
    this.projectAssets = const [],
    this.imageSize,
    this.technologyUsed,
    this.isPublic = false,
    this.isOnPlayStore = false,
    this.isLive = false,
    this.gitHubUrl = "",
    this.hasBeenReleased = true,
    this.playStoreUrl = "",
    this.webUrl = "",
    this.appStoreUrl = "",
    this.navTitleColor = AppColors.grey600,
    this.navSelectedTitleColor = AppColors.black,
    this.appLogoColor = AppColors.black,
  });

  final Color primaryColor;
  final Color navTitleColor;
  final Color navSelectedTitleColor;
  final Color appLogoColor;
  final String image;
  final String coverUrl;
  final String category;
  final List<String> projectAssets;
  final String portfolioDescription;
  final double? imageSize;
  final String title;
  final String subtitle;
  final String platform;
  final String? designer;
  final bool isPublic;
  final bool hasBeenReleased;
  final String gitHubUrl;
  final bool isOnPlayStore;
  final String playStoreUrl;
  final bool isLive;
  final String webUrl;
  final String? technologyUsed;
  final String appStoreUrl;

  factory ProjectItemData.fromMap(Map<String, dynamic> map) {
    return ProjectItemData(
      primaryColor: Color(map['primaryColor']),
      navTitleColor: Color(map['navTitleColor']),
      navSelectedTitleColor: Color(map['navSelectedTitleColor']),
      appLogoColor: Color(map['appLogoColor']),
      image: map['image'],
      coverUrl: map['coverUrl'],
      category: map['category'],
      projectAssets: List<String>.from(map['projectAssets']),
      portfolioDescription: map['portfolioDescription'],
      imageSize: map['imageSize'],
      title: map['title'],
      subtitle: map['subtitle'],
      platform: map['platform'],
      designer: map['designer'],
      isPublic: map['isPublic'],
      hasBeenReleased: map['hasBeenReleased'],
      gitHubUrl: map['gitHubUrl'],
      isOnPlayStore: map['isOnPlayStore'],
      playStoreUrl: map['playStoreUrl'],
      isLive: map['isLive'],
      webUrl: map['webUrl'],
      technologyUsed: map['technologyUsed'],
      appStoreUrl: map['appStoreUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryColor': primaryColor.value,
      'navTitleColor': navTitleColor.value,
      'navSelectedTitleColor': navSelectedTitleColor.value,
      'appLogoColor': appLogoColor.value,
      'image': image,
      'coverUrl': coverUrl,
      'category': category,
      'projectAssets': projectAssets,
      'portfolioDescription': portfolioDescription,
      'imageSize': imageSize,
      'title': title,
      'subtitle': subtitle,
      'platform': platform,
      'designer': designer,
      'isPublic': isPublic,
      'hasBeenReleased': hasBeenReleased,
      'gitHubUrl': gitHubUrl,
      'isOnPlayStore': isOnPlayStore,
      'playStoreUrl': playStoreUrl,
      'isLive': isLive,
      'webUrl': webUrl,
      'technologyUsed': technologyUsed,
      'appStoreUrl': appStoreUrl,
    };
  }
}

class ProjectData extends StatelessWidget {
  const ProjectData({
    super.key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.duration,
    this.curve = Curves.ease,
    this.projectNumberStyle,
    this.subtitleStyle,
    this.titleStyle,
    this.indicatorColor = AppColors.grey550,
    this.indicatorHeight = Sizes.HEIGHT_1,
    this.indicatorWidth = Sizes.WIDTH_150,
    this.indicatorMargin,
    this.leadingMargin,
  });

  final String projectNumber;
  final String title;
  final String subtitle;
  final Color indicatorColor;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final double indicatorWidth;
  final double indicatorHeight;
  final EdgeInsetsGeometry? indicatorMargin;
  final EdgeInsetsGeometry? leadingMargin;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          width: indicatorWidth,
          height: indicatorHeight,
          margin: indicatorMargin,
          color: indicatorColor,
          duration: duration,
          curve: curve,
        ),
        SpaceW4(),
        Text(projectNumber, style: projectNumberStyle),
        SpaceW30(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            SizedBox(height: context.responsive(6, 16)),
            Text(subtitle, style: subtitleStyle),
          ],
        ),
      ],
    );
  }
}

// For rendering on bigger devices eg. tablets, desktops etc.
const double startWidthOfButton = 54;
const double heightOfButton = startWidthOfButton;
const double targetWidthOfButton = 200;
const double startWidthOfButtonMd = 44;
const double heightOfButtonMd = startWidthOfButtonMd;
const double targetWidthOfButtonMd = 160;

// For rendering on mobile devices
const double startWidthOfButtonSm = 40;
const double targetWidthSm = 160;
const double heightOfButtonSm = startWidthOfButtonSm;

class ProjectItemDesktop extends StatefulWidget {
  const ProjectItemDesktop({
    super.key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.containerColor,
    this.projectItemHeight,
    this.subHeight,
    this.coloredContainerHeight,
    this.coloredContainerWidth,
    this.buttonTitle = StringConst.VIEW,
    this.backgroundOnHoverColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.accentColor2,
    this.projectNumberStyle,
    this.subtitleStyle,
    this.titleStyle,
    this.duration = const Duration(milliseconds: 300),
    this.padding,
    this.onTap,
  });

  /// signifies the position of the project in the list
  final String projectNumber;

  /// text for the title of project (usually states the project name)
  final String title;

  /// text for the subtitle of project (usually describes the project or states the platform)
  final String subtitle;

  /// url or location for project image or cover
  final String imageUrl;

  /// text that shows on the button (defaults to view project)
  final String buttonTitle;

  /// style for the project number (signifies the position of the project in the list)
  final TextStyle? projectNumberStyle;

  /// style for the title
  final TextStyle? titleStyle;

  /// style for the subtitle
  final TextStyle? subtitleStyle;

  /// color of the container under the project item image. mostly contains the primary color used in the project
  final Color containerColor;

  /// initial background color of the project item
  final Color backgroundColor;

  /// background color of the project item when it is hovered on
  final Color backgroundOnHoverColor;
  final Duration duration;

  /// full height of the project item
  final double? projectItemHeight;

  /// height of the portion that contains the title, subtitle and button
  final double? subHeight;

  /// height of the colored container under the project image cover
  final double? coloredContainerWidth;

  /// width of the colored container under the project image cover
  final double? coloredContainerHeight;

  /// padding for the title & subtitle section of the project item
  final EdgeInsetsGeometry? padding;

  /// callback for when view project is tapped
  final GestureTapCallback? onTap;

  @override
  State<ProjectItemDesktop> createState() => _ProjectItemDesktopState();
}

class _ProjectItemDesktopState extends State<ProjectItemDesktop> with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;

  // late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _isHovering = hovering;
        _controller.forward();
      });
    } else {
      setState(() {
        _isHovering = hovering;
        _controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // width of the project item - it takes the entire width of the device
    double projectItemWidth = context.widthOfScreen;
    // height of the overall project item - it defaults to 40% of the height of the device
    double projectItemHeight = widget.projectItemHeight ?? context.assignHeight(0.4);
    // it defaults to 75% of the height of the full [projectItemHeight]
    double subHeight = widget.subHeight ?? (3 / 4 * projectItemHeight);
    // defaults to 80% of the height of the [subHeight]
    double containerHeight = widget.coloredContainerHeight ?? (subHeight * 0.8);
    // computes the position of the button, positions the button in the middle
    // of the container using subHeight as it's height
    double positionOfButton = (subHeight / 2) - startWidthOfButton;
    // width of project cover - takes 1/3 of the width of the screen
    double imageWidth = context.responsive(
      projectItemWidth / 3,
      projectItemWidth / 4.5,
      md: projectItemWidth / 3.5,
      sm: projectItemWidth / 3.3,
    );
    Animation<double> animation = Tween<double>(
      begin: context.responsive(
        -imageWidth * 2.2,
        -imageWidth * 1.8,
        md: -imageWidth * 2.2,
      ),
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        setState(() {});
      });
    double buttonWidth = context.responsive(
      startWidthOfButtonMd,
      startWidthOfButton,
      md: startWidthOfButtonMd,
    );
    double buttonTargetWidth = context.responsive(
      targetWidthOfButtonMd,
      targetWidthOfButton,
      md: targetWidthOfButtonMd,
    );
    TextTheme textTheme = Theme.of(context).textTheme;
    // textStyle for button for viewing project
    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(
        Sizes.TEXT_SIZE_14,
        Sizes.TEXT_SIZE_16,
        md: Sizes.TEXT_SIZE_14,
      ),
      fontWeight: FontWeight.w500,
    );
    // textStyle for the current number or position of project in the list
    TextStyle? defaultNumberStyle = widget.projectNumberStyle ??
        textTheme.labelLarge?.copyWith(
          fontSize: _isHovering ? Sizes.TEXT_SIZE_20 : Sizes.TEXT_SIZE_16,
          color: AppColors.grey550,
          fontWeight: _isHovering ? FontWeight.w400 : FontWeight.w300,
        );
    // textStyle for the title or name of the project
    TextStyle? defaultTitleStyle = widget.titleStyle ??
        textTheme.labelLarge?.copyWith(
          color: AppColors.black,
          fontSize: context.responsive(24, 40, md: 36, sm: 30),
        );
    // textStyle for the subtitle (describing project platform) of the project
    TextStyle? defaultSubtitleStyle = widget.subtitleStyle ??
        textTheme.bodyLarge?.copyWith(
          color: AppColors.grey700,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          letterSpacing: 2.5,
          // fontWeight: FontWeight.w500,
        );
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SizedBox(
        height: projectItemHeight,
        width: projectItemWidth,
        child: Stack(
          children: [
            Container(
              width: projectItemWidth,
              height: subHeight,
              padding: widget.padding ?? EdgeInsets.only(top: subHeight / 4),
              color: _isHovering ? widget.backgroundOnHoverColor : widget.backgroundColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    opacity: _isHovering ? 1.0 : 0.5,
                    duration: widget.duration,
                    child: ProjectData(
                      duration: Duration(milliseconds: 400),
                      projectNumber: widget.projectNumber,
                      indicatorWidth: _isHovering ? context.assignWidth(.18) : context.assignWidth(.12),
                      leadingMargin: EdgeInsets.only(
                          top: (defaultTitleStyle!.fontSize! - defaultNumberStyle!.fontSize!) / 2.5,
                          right: Sizes.MARGIN_8),
                      indicatorMargin: EdgeInsets.only(top: defaultNumberStyle.fontSize! / 2.5, right: Sizes.MARGIN_8),
                      title: widget.title,
                      subtitle: widget.subtitle,
                      subtitleStyle: defaultSubtitleStyle,
                      titleStyle: defaultTitleStyle,
                      projectNumberStyle: defaultNumberStyle,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              child: Transform(
                origin: Offset(animation.value, 0),
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0095)
                  ..rotateY(0.075),
                child: Container(
                  width: imageWidth,
                  height: containerHeight - 10,
                  decoration: BoxDecoration(
                    color: widget.containerColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(
                    widget.imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: positionOfButton, //places button
              right: context.assignWidth(.1),
              child: AnimatedBubbleButton(
                showShadow: true,
                startWidth: buttonWidth,
                hovering: _isHovering,
                controller: _controller,
                duration: widget.duration,
                controlsOwnAnimation: false,
                height: buttonWidth,
                targetWidth: buttonTargetWidth,
                startBorderRadius: const BorderRadius.all(Radius.circular(100.0)),
                title: StringConst.VIEW_PROJECT.toUpperCase(),
                color: AppColors.grey100,
                titleStyle: buttonStyle,
                imageColor: AppColors.black,
                onTap: widget.onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItemTablet extends StatefulWidget {
  const ProjectItemTablet({
    super.key,
    required this.projectNumber,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.containerColor,
    this.buttonTitle = StringConst.VIEW,
    this.projectNumberStyle,
    this.subtitleStyle,
    this.titleStyle,
    this.coloredContainerHeight,
    this.coloredContainerWidth,
    this.imageWidth,
    this.imageHeight,
    this.duration = const Duration(milliseconds: 350),
    this.onTap,
  });

  final String projectNumber;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String buttonTitle;
  final TextStyle? projectNumberStyle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Color containerColor;
  final Duration duration;
  final double? imageWidth;
  final double? imageHeight;
  final double? coloredContainerWidth;
  final double? coloredContainerHeight;

  /// callback for when view project is tapped
  final GestureTapCallback? onTap;

  @override
  State<ProjectItemTablet> createState() => _ProjectItemTabletState();
}

class _ProjectItemTabletState extends State<ProjectItemTablet> with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _isHovering = hovering;
        _controller.forward();
      });
    } else {
      setState(() {
        _isHovering = hovering;
        _controller.reverse();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // takes 40% of the height of the device
    double heightOfProjectImageCover = widget.imageHeight ?? context.assignHeight(0.3);
    // takes 30% of the height of the device
    double heightOfColoredContainer = widget.coloredContainerHeight ?? context.assignHeight(0.3);
    // this positions the colored container at the middle of the cover image.
    double positionOfColoredContainer = heightOfProjectImageCover / 2;
    TextTheme textTheme = Theme.of(context).textTheme;
    // textStyle for button for viewing project
    TextStyle? buttonStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.black,
      fontSize: context.responsive(10, 14),
      fontWeight: FontWeight.w500,
    );
    // textStyle for the current number or position of project in the list
    TextStyle? defaultNumberStyle = widget.projectNumberStyle ??
        textTheme.labelLarge?.copyWith(
          fontSize: _isHovering ? Sizes.TEXT_SIZE_18 : Sizes.TEXT_SIZE_16,
          color: AppColors.grey550,
          fontWeight: _isHovering ? FontWeight.w400 : FontWeight.w300,
        );
    // textStyle for the title or name of the project
    TextStyle? defaultTitleStyle = widget.titleStyle ??
        textTheme.labelLarge?.copyWith(
          color: AppColors.black,
          fontSize: 26,
        );
    // textStyle for the subtitle (describing project platform) of the project
    TextStyle? defaultSubtitleStyle = widget.subtitleStyle ??
        textTheme.bodyLarge?.copyWith(
          color: AppColors.grey700,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 2.5,
        );

    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Column(
        children: [
          SizedBox(width: context.responsive(0, 12)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProjectData(
                duration: widget.duration,
                projectNumber: widget.projectNumber,
                indicatorWidth: context.assignWidth(.1),
                leadingMargin: EdgeInsets.only(
                  top: (defaultTitleStyle!.fontSize! - defaultNumberStyle!.fontSize!) / 2.5,
                  right: Sizes.MARGIN_8,
                ),
                indicatorMargin: EdgeInsets.only(top: defaultNumberStyle.fontSize! / 2.5, right: Sizes.MARGIN_8),
                title: widget.title,
                subtitle: widget.subtitle,
                subtitleStyle: defaultSubtitleStyle,
                titleStyle: defaultTitleStyle,
                projectNumberStyle: defaultNumberStyle,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(left: context.responsive(10, 0), right: context.responsive(0, 30)),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedBubbleButton(
                    startWidth: startWidthOfButtonSm,
                    hovering: _isHovering,
                    controller: _controller,
                    duration: widget.duration,
                    height: startWidthOfButtonSm,
                    targetWidth: targetWidthSm,
                    controlsOwnAnimation: false,
                    startBorderRadius: const BorderRadius.all(Radius.circular(100.0)),
                    title: StringConst.VIEW_PROJECT.toUpperCase(),
                    color: AppColors.grey100,
                    titleStyle: buttonStyle,
                    imageColor: AppColors.black,
                    onTap: widget.onTap,
                  ),
                ),
              ),
            ],
          ),
          SpaceH16(),
          SizedBox(
            height: heightOfProjectImageCover + (heightOfColoredContainer - positionOfColoredContainer),
            child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.0095)
                ..rotateY(0.085),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.imageUrl,
                  height: heightOfProjectImageCover,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
