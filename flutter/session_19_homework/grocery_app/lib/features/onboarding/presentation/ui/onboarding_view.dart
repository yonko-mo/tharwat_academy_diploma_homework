import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_buttons.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_dots_indicator.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_page_view.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;
  int _currentPage = 0;

  final List<OnboardingItemModel> _items = const [
    OnboardingItemModel(
      image: Assets.assetsImagesPngsOnboardingImage1,
      title: 'Welcome to Fresh Fruits Grocery application',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
      imageToTitleSpacing: 6,
    ),
    OnboardingItemModel(
      image: Assets.assetsImagesPngsOnboardingImage1,
      title: 'We provide best quality Fruits to your family',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
      imageToTitleSpacing: 22,
    ),
    OnboardingItemModel(
      image: Assets.assetsImagesPngsOnboardingImage2,
      title: 'Fast and responsibility delivery by our courier',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
      imageToTitleSpacing: 133.5,
      imageTopSpacing: 79.98,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 29.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: OnboardingPageView(
                pageController: _pageController,
                items: _items,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),
            OnboardingDotsIndicator(
              currentPage: _currentPage,
              itemCount: _items.length,
            ),
            const SizedBox(height: 41),
            OnboardingButtons(
              currentPage: _currentPage,
              itemCount: _items.length,
              onNextPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              onCreateAccountPressed: () {
                // Handle create account
              },
              onLoginPressed: () {
                // Handle login
              },
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
