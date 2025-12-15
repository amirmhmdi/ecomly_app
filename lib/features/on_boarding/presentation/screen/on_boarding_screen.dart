import 'package:ecomly_app/features/on_boarding/presentation/on_boarding_info_section.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageControler = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PageView(
            controller: pageControler,
            allowImplicitScrolling: true,
            children: [
              OnBoardingInfoSection.first(),
              OnBoardingInfoSection.secend(),
            ],
          ),
        ),
      ),
    );
  }
}
