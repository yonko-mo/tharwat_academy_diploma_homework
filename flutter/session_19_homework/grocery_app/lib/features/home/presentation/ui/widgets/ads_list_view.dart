import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/ad_item.dart';

class AdsListView extends StatelessWidget {
  const AdsListView({super.key});

  static const List<({String assetName, String title})> _ads = [
    (
      assetName: Assets.assetsImagesPngsRecommendedRecipeImage,
      title: 'Recommended \nRecipe Today',
    ),
    (
      assetName: Assets.assetsImagesPngsFreshFruitsDeliveryImage,
      title: 'Fresh Fruits \nDelivery',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _ads.length,
        itemBuilder: (context, index) => AdItem(
          assetName: _ads[index].assetName,
          title: _ads[index].title,
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }
}
