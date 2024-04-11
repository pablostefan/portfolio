import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/stores/contact/contact_store.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_links.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/ui_helpers/app_vectors.dart';
import 'package:portfolio/ui_helpers/ui_helpers.dart';
import 'package:portfolio/view_models/contact/contact_view_model.dart';
import 'package:portfolio/widgets/code_message_widget/code_message_widget.dart';
import 'package:portfolio/widgets/expansion_title_widget/expansion_title_item_widget.dart';
import 'package:portfolio/widgets/expansion_title_widget/expansion_title_widget.dart';
import 'package:portfolio/widgets/text_field_widget/text_field_widget.dart';

class ContactDesktop extends StatefulWidget {
  const ContactDesktop({super.key});

  @override
  State<ContactDesktop> createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  final ContactStore _store = GetIt.I<ContactStore>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        left: false,
        right: false,
        child: Row(children: [
          Container(
              width: AppSpacing.extraGiant,
              decoration: const BoxDecoration(border: Border.symmetric(vertical: BorderSide(color: AppColors.border))),
              child: Column(children: [
                ExpansionTileWidget(title: AppLocale.contacts.getString(context), children: [
                  ExpansionTitleItemWidget(icon: AppVectors.mail, title: AppLinks.email, onTap: () {}),
                  ExpansionTitleItemWidget(icon: AppVectors.phone, title: AppLinks.phone, onTap: () {}),
                ]),
                ExpansionTileWidget(title: AppLocale.findMeAlso.getString(context), children: [
                  ExpansionTitleItemWidget(icon: AppVectors.mail, title: AppLinks.email, onTap: () {}),
                  ExpansionTitleItemWidget(icon: AppVectors.phone, title: AppLinks.phone, onTap: () {}),
                ]),
              ])),
          TripleBuilder<ContactStore, ContactViewModel>(
              store: _store,
              builder: (_, triple) => Expanded(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: UiHelper.getResponsiveHorizontalSpaceMedium(context)),
                      decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocale.name.getString(context)).bodySmallRegular().color(AppColors.secondaryOne),
                            TextFieldWidget(
                                controller: triple.state.nameController,
                                padding: const EdgeInsets.only(top: AppSpacing.micro, bottom: AppSpacing.xxs)),
                            Text(AppLocale.email.getString(context)).bodySmallRegular().color(AppColors.secondaryOne),
                            TextFieldWidget(
                                controller: triple.state.emailController,
                                padding: const EdgeInsets.only(top: AppSpacing.micro, bottom: AppSpacing.xxs)),
                            Text(AppLocale.message.getString(context)).bodySmallRegular().color(AppColors.secondaryOne),
                            TextFieldWidget(
                                controller: triple.state.messageController,
                                padding: const EdgeInsets.only(top: AppSpacing.micro, bottom: AppSpacing.xxs),
                                height: AppSpacing.huge,
                                maxLines: null,
                                expands: true),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: AppSpacing.atto,
                                    backgroundColor: AppColors.border,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSpacing.nano)),
                                    padding: const EdgeInsets.all(AppSpacing.micro)),
                                onPressed: _store.onSubmitMessage,
                                child: Text(AppLocale.submitMessage.getString(context)).bodyExtraSmallRegular()),
                          ])))),
          TripleBuilder<ContactStore, ContactViewModel>(
              store: _store,
              builder: (_, triple) => Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                      decoration: const BoxDecoration(border: Border(right: BorderSide(color: AppColors.border))),
                      child: CodeMessageWidget(
                          name: triple.state.name, email: triple.state.email, message: triple.state.message)))),
        ]));
  }
}
