import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/layout/adaptive.dart';
import 'package:portfolio/presentation/contact/controller/contact_controller.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_positioned_text.dart';
import 'package:portfolio/shared/widgets/animated_text_slide_box_transition.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/custom_spacer.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';
import 'package:portfolio/shared/widgets/portfolio_text_form_field.dart';
import 'package:portfolio/shared/widgets/simple_footer.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  final ContactController _contactController = GetIt.I.get<ContactController>();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    _slideAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.6, 1.0, curve: Curves.ease),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? initialErrorStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.white,
      fontSize: Sizes.TEXT_SIZE_12,
    );
    TextStyle? errorStyle = textTheme.bodyLarge?.copyWith(
      color: AppColors.errorRed,
      fontWeight: FontWeight.w400,
      fontSize: Sizes.TEXT_SIZE_12,
      letterSpacing: 1,
    );
    double contentAreaWidth = responsiveSize(
      context,
      assignWidth(context, 0.8),
      assignWidth(context, 0.6),
    ); //takes 60% of screen

    double buttonWidth = responsiveSize(
      context,
      contentAreaWidth * 0.6,
      contentAreaWidth * 0.25,
    );
    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: responsiveSize(
        context,
        assignWidth(context, .1),
        assignWidth(context, .15),
      ),
      right: responsiveSize(
        context,
        assignWidth(context, .1),
        assignWidth(context, .25),
      ),
      top: responsiveSize(
        context,
        assignHeight(context, .1),
        assignHeight(context, .15),
      ),
    );
    TextStyle? headingStyle = textTheme.headlineLarge?.copyWith(
      color: AppColors.black,
      fontSize: responsiveSize(context, 40, 60),
    );

    return PageWrapper(
      selectedRoute: Routes.contact,
      selectedPageName: StringConst.CONTACT,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedTextSlideBoxTransition(
                    controller: _controller,
                    text: StringConst.GET_IN_TOUCH,
                    textStyle: headingStyle,
                  ),
                  CustomSpacer(heightFactor: 0.05),
                  AnimatedPositionedText(
                    width: contentAreaWidth,
                    controller: CurvedAnimation(
                      parent: _controller,
                      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
                    ),
                    text: StringConst.CONTACT_MSG,
                    maxLines: 5,
                    textStyle: textTheme.bodyLarge?.copyWith(
                      color: AppColors.grey700,
                      height: 2.0,
                      fontSize: responsiveSize(
                        context,
                        Sizes.TEXT_SIZE_16,
                        Sizes.TEXT_SIZE_18,
                      ),
                    ),
                  ),
                  CustomSpacer(heightFactor: 0.05),
                  ListenableBuilder(
                      listenable: _contactController,
                      builder: (_, __) {
                        return SlideTransition(
                          position: _slideAnimation,
                          child: Column(
                            children: [
                              PortfolioTextFormField(
                                hasTitle: _contactController.nameHasError,
                                title: StringConst.NAME_ERROR_MSG,
                                titleStyle: _contactController.nameHasError ? errorStyle : initialErrorStyle,
                                hintText: StringConst.YOUR_NAME,
                                controller: _contactController.nameController,
                                filled: _contactController.nameFilled,
                                onChanged: _contactController.isNameValid,
                              ),
                              SpaceH20(),
                              PortfolioTextFormField(
                                hasTitle: _contactController.emailHasError,
                                title: StringConst.EMAIL_ERROR_MSG,
                                titleStyle: _contactController.emailHasError ? errorStyle : initialErrorStyle,
                                hintText: StringConst.EMAIL,
                                controller: _contactController.emailController,
                                filled: _contactController.emailFilled,
                                onChanged: _contactController.isEmailValid,
                              ),
                              SpaceH20(),
                              PortfolioTextFormField(
                                hasTitle: _contactController.subjectHasError,
                                title: StringConst.SUBJECT_ERROR_MSG,
                                titleStyle: _contactController.subjectHasError ? errorStyle : initialErrorStyle,
                                hintText: StringConst.SUBJECT,
                                controller: _contactController.subjectController,
                                filled: _contactController.subjectFilled,
                                onChanged: _contactController.isSubjectValid,
                              ),
                              SpaceH20(),
                              PortfolioTextFormField(
                                hasTitle: _contactController.messageHasError,
                                title: StringConst.MESSAGE_ERROR_MSG,
                                titleStyle: _contactController.messageHasError ? errorStyle : initialErrorStyle,
                                hintText: StringConst.MESSAGE,
                                controller: _contactController.messageController,
                                filled: _contactController.messageFilled,
                                textInputType: TextInputType.multiline,
                                maxLines: 5,
                                onChanged: _contactController.isMessageValid,
                              ),
                              SpaceH20(),
                              ValueListenableBuilder(
                                valueListenable: _contactController.isLoading,
                                builder: (_, value, __) {
                                  return Align(
                                    alignment: Alignment.topRight,
                                    child: PortfolioButton(
                                      height: Sizes.HEIGHT_56,
                                      width: buttonWidth,
                                      isLoading: value,
                                      title: StringConst.SEND_MESSAGE.toUpperCase(),
                                      onPressed: () => _contactController.sendEmail(context),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
          CustomSpacer(heightFactor: 0.15),
          SimpleFooter(),
        ],
      ),
    );
  }
}
