import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_colors.dart';

class OnboardingDotsIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;

  const OnboardingDotsIndicator({
    super.key,
    required this.currentPage,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: currentPage == index ? 28 : 10,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.activeDotColor
                : AppColors.inactiveDotColor,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
