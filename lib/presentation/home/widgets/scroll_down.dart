import 'package:flutter/material.dart';
import 'package:portfolio/shared/values/values.dart';
import 'package:portfolio/shared/widgets/spaces.dart';

class ScrollDownButton extends StatelessWidget {
  const ScrollDownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RotatedBox(
          quarterTurns: 1,
          child: Text(
            StringConst.SCROLL_DOWN.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize: 10,
                  letterSpacing: 1.7,
                ),
          ),
        ),
        SpaceH16(),
        Image.asset(
          ImagePath.ARROW_DOWN,
          height: 20,
        ),
      ],
    );
  }
}
