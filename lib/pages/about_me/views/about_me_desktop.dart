import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/models/about_me_selected_page_model.dart';
import 'package:portfolio/stores/about_me/about_me_store.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_links.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';
import 'package:portfolio/view_models/about_me/about_me_view_model.dart';
import 'package:portfolio/widgets/about_me/about_me_text_desktop_widget.dart';
import 'package:portfolio/widgets/expansion_title/expansion_title_item_widget.dart';
import 'package:portfolio/widgets/expansion_title/expansion_title_widget.dart';
import 'package:portfolio/widgets/selectable_expansion_title/selectable_expansion_title_item_widget.dart';
import 'package:portfolio/widgets/selectable_expansion_title/selectable_expansion_title_widget.dart';
import 'package:portfolio/widgets/works/works_desktop_widget.dart';

class AboutMeDesktop extends StatefulWidget {
  const AboutMeDesktop({super.key});

  @override
  State<AboutMeDesktop> createState() => _AboutMeDesktopState();
}

class _AboutMeDesktopState extends State<AboutMeDesktop> {
  final AboutMeStore _store = GetIt.I<AboutMeStore>();

  @override
  Widget build(BuildContext context) {
    return TripleBuilder<AboutMeStore, AboutMeViewModel>(
        store: _store,
        builder: (_, triple) {
          return SafeArea(
              left: false,
              right: false,
              child: Row(children: [
                Container(
                    width: AppSpacing.extraGiant,
                    decoration:
                        const BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: AppColors.border))),
                    child: ListView(children: [
                      SelectableExpansionTileWidget(title: AppLocale.personalInfo.getString(context), children: [
                        SelectableExpansionTitleItemWidget(
                            selectedIconColor: AppColors.accentThree,
                            icon: AppVectors.personalInfo,
                            title: AppLocale.bio.getString(context),
                            page: AboutMePageModel.bio,
                            selectedPage: triple.state.selectedPage,
                            onTap: _store.onTapMenuItem),
                        SelectableExpansionTitleItemWidget(
                            selectedIconColor: AppColors.accentTwo,
                            icon: AppVectors.code,
                            title: AppLocale.works.getString(context),
                            page: AboutMePageModel.works,
                            selectedPage: triple.state.selectedPage,
                            onTap: _store.onTapMenuItem),
                      ]),
                      ExpansionTileWidget(
                          title: AppLocale.contacts.getString(context),
                          childrenPadding: const EdgeInsets.only(left: AppSpacing.nano, top: AppSpacing.femto),
                          children: [
                            ExpansionTitleItemWidget(icon: AppVectors.mail, title: AppLinks.email, onTap: () {}),
                            ExpansionTitleItemWidget(icon: AppVectors.phone, title: AppLinks.phone, onTap: () {}),
                          ]),
                    ])),
                Expanded(
                    child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: triple.state.pageController,
                        scrollDirection: Axis.vertical,
                        children: const [
                      AboutMeDesktopWidget(),
                      WorksDesktopWidget(),
                    ]))
              ]));
        });
  }
}
