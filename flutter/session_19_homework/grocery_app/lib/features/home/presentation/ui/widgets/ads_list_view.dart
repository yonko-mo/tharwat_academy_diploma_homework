import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/ad_item.dart';

class AdsListView extends StatefulWidget {
  const AdsListView({super.key});

  @override
  State<AdsListView> createState() => _AdsListViewState();
}

class _AdsListViewState extends State<AdsListView> {
  final List<AdItem> adsItems = [
    const AdItem(
      assetName: Assets.assetsImagesPngsRecommendedRecipeImage,
      title: 'Recommended \nRecipe Today',
    ),
    const AdItem(
      assetName: Assets.assetsImagesPngsFreshFruitsDeliveryImage,
      title: 'Fresh Fruits \nDelivery',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 162,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: adsItems.length,
        itemBuilder: (context, index) {
          return adsItems[index];
        },
        separatorBuilder: (context, index) => const SizedBox(width: 20),
      ),
    );
  }
}
