import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:portfolio/extensions/date_extensions.dart';
import 'package:portfolio/l10n/app_locale.dart';
import 'package:portfolio/models/work_model.dart';
import 'package:portfolio/ui_helpers/app_colors.dart';
import 'package:portfolio/ui_helpers/app_spacing.dart';
import 'package:portfolio/ui_helpers/app_typography.dart';
import 'package:portfolio/widgets/mouse_transforms/scale_on_hover_widget.dart';

class WorkCardWidget extends StatelessWidget {
  final WorkModel work;

  const WorkCardWidget({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return ScaleOnHoverWidget(
        hoverScale: 1.007,
        child: GestureDetector(
            onTap: () => html.window.open(work.url, 'new tab'),
            child: Container(
                width: 350,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: AppColors.border)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.nano)),
                        child: Image.asset(work.background.path,
                            opacity: const AlwaysStoppedAnimation(.8), fit: BoxFit.fitWidth)),
                    DecoratedBox(
                        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(color: work.shadowColor.withOpacity(.4), blurRadius: 7, spreadRadius: 4)
                        ]),
                        child: Image.asset(work.image.path, width: 90, fit: BoxFit.fitWidth)),
                    Visibility(
                        visible: work.isCurrent,
                        child: Positioned(
                            top: 0,
                            right: 0,
                            child: Padding(
                                padding: const EdgeInsets.all(AppSpacing.nano),
                                child: Icon(Icons.star_rounded,
                                    color: Colors.amber,
                                    shadows: [
                                      BoxShadow(color: Colors.black.withOpacity(.4), blurRadius: 4, spreadRadius: 2)
                                    ],
                                    size: 30))))
                  ]),
                  Padding(
                      padding: const EdgeInsets.all(AppSpacing.nano),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Padding(
                            padding: const EdgeInsets.only(top: AppSpacing.femto),
                            child: Text(work.name.getString(context)).bodyLabelRegular().color(AppColors.secondaryTwo)),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppSpacing.nano),
                            child: Visibility(
                                visible: work.isCurrent,
                                replacement: Text("${work.startDate.workDate} - ${work.endDate.workDate}")
                                    .bodyExtraSmallRegular()
                                    .color(AppColors.secondaryThree),
                                child: Text("${work.startDate.workDate} - ${AppLocale.currently.getString(context)}")
                                    .bodyExtraSmallRegular()
                                    .color(AppColors.secondaryThree))),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppSpacing.nano),
                            child: Text(work.description.getString(context))
                                .bodyExtraSmallRegular()
                                .color(AppColors.secondaryOne)),
                      ]))
                ]))));
  }
}
