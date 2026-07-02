import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/onboarding/data/models/onboarding_item_model.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_buttons.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_dots_indicator.dart';
import 'package:grocery_app/features/onboarding/presentation/ui/widgets/onboarding_page_item.dart';

class OnboardingPageView extends StatefulWidget {
  const OnboardingPageView({super.key});

  @override
  State<OnboardingPageView> createState() => _OnboardingPageViewState();
}

class _OnboardingPageViewState extends State<OnboardingPageView> {
  late final PageController _pageController;
  late final ValueNotifier<int> _currentPage;

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
    _currentPage = ValueNotifier<int>(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _items.length,
            onPageChanged: (index) => _currentPage.value = index,
            itemBuilder: (context, index) {
              return OnboardingPageItem(item: _items[index]);
            },
          ),
        ),
        const SizedBox(height: 24),
        ValueListenableBuilder<int>(
          valueListenable: _currentPage,
          builder: (context, currentPage, _) {
            return OnboardingDotsIndicator(
              currentPage: currentPage,
              itemCount: _items.length,
            );
          },
        ),
        const SizedBox(height: 41),
        ValueListenableBuilder<int>(
          valueListenable: _currentPage,
          builder: (context, currentPage, _) {
            return OnboardingButtons(
              currentPage: currentPage,
              itemCount: _items.length,
              onNextPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
            );
          },
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
