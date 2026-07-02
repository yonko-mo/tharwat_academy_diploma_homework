import 'package:flutter/material.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_page_view.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.0),
        child: OnboardingPageView(),
      ),
    );
  }
}
