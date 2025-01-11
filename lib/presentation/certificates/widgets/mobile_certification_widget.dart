import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/functions.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/portfolio_button.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MobileCertificationWidget extends StatefulWidget {
  final CertificationData data;

  const MobileCertificationWidget({super.key, required this.data});

  @override
  State<MobileCertificationWidget> createState() => _MobileCertificationWidgetState();
}

class _MobileCertificationWidgetState extends State<MobileCertificationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hasAnimate = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(lowerBound: .02, duration: Durations.extralong4, vsync: this);
  }

  dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction >= .4 && !_hasAnimate && mounted) {
      _controller.forward();
      _hasAnimate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: _onVisibilityChanged,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) => Opacity(opacity: _controller.value, child: child),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                widget.data.image,
                filterQuality: FilterQuality.low,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              width: double.infinity,
              color: AppColors.white.withOpacity(.9),
              padding: const EdgeInsets.symmetric(vertical: Sizes.PADDING_8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widget.data.code?.isNotEmpty ?? false,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Sizes.PADDING_4),
                      child: SelectableText.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: StringConst.CODE,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.black,
                                    fontSize: Sizes.TEXT_SIZE_10,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            TextSpan(
                              text: widget.data.code,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.black,
                                    fontSize: Sizes.TEXT_SIZE_10,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: .6,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 6,
                            offset: const Offset(3, 3),
                          ),
                        ],
                      ),
                      child: PortfolioButton(
                        height: Sizes.HEIGHT_30,
                        hasIcon: false,
                        width: 90,
                        buttonColor: AppColors.white,
                        borderColor: AppColors.black,
                        onHoverColor: AppColors.black,
                        title: StringConst.VIEW,
                        onPressed: () => Functions.launchUrl(widget.data.url),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
