import 'package:flutter/material.dart';
import 'package:portfolio/core/layout/extensions.dart';
import 'package:portfolio/routing/routes.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/animated_footer.dart';
import 'package:portfolio/shared/widgets/content_area.dart';
import 'package:portfolio/shared/widgets/page_header.dart';
import 'package:portfolio/shared/widgets/page_wrapper.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double contentAreaWidth = context.responsiveSize(
      context.assignWidth(.8),
      context.assignWidth(.75),
      sm: context.assignWidth(.8),
    );

    EdgeInsetsGeometry padding = EdgeInsets.only(
      left: context.responsiveSize(context.assignWidth(.1), context.assignWidth(.15)),
      right: context.responsiveSize(context.assignWidth(.1), context.assignWidth(.1)),
      top: context.responsiveSize(context.assignHeight(.15), context.assignHeight(.15)),
    );

    return PageWrapper(
      selectedRoute: Routes.privacyPolicy,
      selectedPageName: StringConst.PRIVACY_POLICY,
      navBarAnimationController: _controller,
      onLoadingAnimationDone: _controller.forward,
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          PageHeader(
            headingText: StringConst.PRIVACY_POLICY,
            headingTextController: _controller,
          ),
          Padding(
            padding: padding,
            child: ContentArea(
              width: contentAreaWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Privacy Policy",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "Thank you for using any of the following apps: Drop, Flutter Catalog, Login Catalog, FoodyBite, and Roam. We respect your privacy and want to be transparent about how we handle your personal information.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Information Collection",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "We want to assure you that we do not collect any personally identifiable information from our users. We do not request, store, or have access to any data that could be used to identify you personally.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Usage Information",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "While you use Drop, Flutter Catalog, Login Catalog, FoodyBite, and Roam, we do not track your activities or gather any usage information. Your interactions with the apps remain entirely anonymous.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Third-Party Services",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    "Our apps do not integrate with any third-party services that collect user data. We prioritize your privacy and aim to provide a secure and enjoyable experience without compromising your personal information.",
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                  Text(
                    "Contact",
                    style: theme.textTheme.titleLarge,
                  ),
                  SpaceH12(),
                  Text(
                    '''If you have any questions or concerns regarding our privacy policy, please feel free to contact us at davidcobbina47@gmail.com.\nThank you for trusting us with your privacy.''',
                    style: theme.textTheme.bodyLarge,
                  ),
                  SpaceH20(),
                ],
              ),
            ),
          ),
          SpaceH40(),
          AnimatedFooter(),
        ],
      ),
    );
  }
}
