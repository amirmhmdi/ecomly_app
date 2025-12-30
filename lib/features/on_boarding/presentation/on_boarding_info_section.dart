import 'package:ecomly_app/core/res/media.dart';
import 'package:ecomly_app/core/res/styles/colours.dart';
import 'package:ecomly_app/core/res/styles/text.dart';
import 'package:flutter/material.dart';

class OnBoardingInfoSection extends StatelessWidget {
  const OnBoardingInfoSection.first({super.key}) : isFirst = true;
  const OnBoardingInfoSection.secend({super.key}) : isFirst = false;

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.center,
      children: [
        Image.asset(isFirst ? Media.onboardingFemale : Media.onboardingMale),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            switch (isFirst) {
              true => Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: '${DateTime.now().year}\n',
                  style: TextStyles.headingBold.copyWith(color: Colors.orange),
                  children: [
                    TextSpan(
                      text: "Winter sale is live now.",
                      style: TextStyle(
                        color: Colours.classicAdaptiveTextColour(context),
                      ),
                    ),
                  ],
                ),
              ),
              _ => Text.rich(
                textAlign: TextAlign.left,
                TextSpan(
                  text: "Flash sale\n",
                  style: TextStyles.headingBold.copyWith(
                    color: Colours.classicAdaptiveTextColour(context),
                  ),
                  children: [
                    const TextSpan(
                      text: "Men's ",
                      style: TextStyle(
                        color: Colours.lightThemeSecondaryTextColour,
                      ),
                    ),
                    TextSpan(
                      text: "Shirts and Watches",
                      style: TextStyle(
                        color: Colours.classicAdaptiveTextColour(context),
                      ),
                    ),
                  ],
                ),
              ),
            },
          ],
        ),
      ],
    );
  }
}
