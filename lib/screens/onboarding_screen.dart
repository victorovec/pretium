import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretium/widgets/onboarding_widget.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();
    
    return Scaffold(
       backgroundColor: Color(0xFFbfbfbf),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: [
            OnboardingWidget(
              iconText: 'assets/icons/onboard_icon1.png',
              boldText: 'Direct Pay',
              text: 'Pay with crypto across Africa effortlessly',
              buttonText: 'Next',
              pageController: pageController,
            ),
            OnboardingWidget(
              iconText: 'assets/icons/onboard_icon2.png',
              boldText: 'Accept Payments',
              text: 'Accept stablecoin payments hassle-free',
              buttonText: 'Next',
              pageController: pageController,
            ),
            OnboardingWidget(
              iconText: 'assets/icons/onboard_icon3.png',
              boldText: 'Pay Bills',
              text: 'Pay for utility services and earn rewards',
              buttonText: 'Get Started',
              pageController: pageController,
            ),
          ],
          onPageChanged: (index) {
            ref.read(currentIndexProvider.notifier).state = index;
          },
        ),
      ),
    );
  }
}

final currentIndexProvider = StateProvider<int>((ref) => 0);
