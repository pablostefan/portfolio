import 'package:gap/gap.dart';

/// none = 0 |
/// atto = 2 |
/// femto = 4 |
/// pico = 6 |
/// nano = 8 |
/// micro = 12 |
/// xxxs = 16 |
/// xxs = 24 |
/// xs = 32 |
/// sm = 40 |
/// md = 48 |
/// lg = 56 |
/// xl = 64 |
/// xxl = 80 |
/// xxxl = 120 |
/// huge = 160 |
/// giant = 200
abstract class AppSpacing {
  static const double none = 0;
  static const double atto = 2;
  static const double femto = 4;
  static const double pico = 6;
  static const double nano = 8;
  static const double micro = 12;
  static const double xxxs = 16;
  static const double xxs = 24;
  static const double xs = 32;
  static const double sm = 40;
  static const double md = 48;
  static const double lg = 56;
  static const double xl = 64;
  static const double xxl = 80;
  static const double xxxl = 120;
  static const double huge = 160;
  static const double giant = 200;
  static const double extraGiant = 300;


  //Gaps
  ///2
  static const Gap gapAtto = Gap(atto);

  ///4
  static const Gap gapFemto = Gap(femto);

  ///6
  static const Gap gapPico = Gap(pico);

  ///8
  static const Gap gapNano = Gap(nano);

  ///12
  static const Gap gapMicro = Gap(micro);

  ///16
  static const Gap gapXxxs = Gap(xxxs);

  ///24
  static const Gap gapXxs = Gap(xxs);

  ///32
  static const Gap gapXs = Gap(xs);

  ///40
  static const Gap gapSm = Gap(sm);

  ///48
  static const Gap gapMd = Gap(md);

  ///56
  static const Gap gapLg = Gap(lg);

  ///64
  static const Gap gapXl = Gap(xl);

  ///80
  static const Gap gapXxl = Gap(xxl);

  ///120
  static const Gap gapHuge = Gap(huge);

  //SliverGaps
  ///2
  static const SliverGap sliverGapAtto = SliverGap(atto);

  ///4
  static const SliverGap sliverGapFemto = SliverGap(femto);

  ///6
  static const SliverGap sliverGapPico = SliverGap(pico);

  ///8
  static const SliverGap sliverGapNano = SliverGap(nano);

  ///12
  static const SliverGap sliverGapMicro = SliverGap(micro);

  ///16
  static const SliverGap sliverGapXxxs = SliverGap(xxxs);

  ///24
  static const SliverGap sliverGapXxs = SliverGap(xxs);

  ///32
  static const SliverGap sliverGapXs = SliverGap(xs);

  ///40
  static const SliverGap sliverGapSm = SliverGap(sm);

  ///48
  static const SliverGap sliverGapMd = SliverGap(md);

  ///56
  static const SliverGap sliverGapLg = SliverGap(lg);
}
