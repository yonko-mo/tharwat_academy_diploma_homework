import 'package:flutter/material.dart';
import 'package:grocery_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_page.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController pageController;
  final ValueChanged<int> onPageChanged;
  final List<OnboardingItemModel> items;

  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: items.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        return OnboardingPage(item: items[index]);
      },
    );
  }
}
