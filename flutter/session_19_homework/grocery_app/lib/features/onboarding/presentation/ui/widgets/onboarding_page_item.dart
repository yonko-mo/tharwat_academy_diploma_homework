import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/features/onboarding/data/models/onboarding_item_model.dart';

class OnboardingPageItem extends StatelessWidget {
  final OnboardingItemModel item;

  const OnboardingPageItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (item.imageTopSpacing != null)
          SizedBox(height: item.imageTopSpacing),
        Image.asset(item.image, width: MediaQuery.sizeOf(context).width),
        SizedBox(height: item.imageToTitleSpacing),
        Text(
          item.title,
          textAlign: TextAlign.center,
          style: AppStyles.titleTextStyle,
        ),
        const SizedBox(height: 34),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Text(
            item.description,
            textAlign: TextAlign.center,
            style: AppStyles.bodyTextStyle,
          ),
        ),
      ],
    );
  }
}
