import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/trending_deals_item.dart';

class TrendingDealsGridView extends StatefulWidget {
  const TrendingDealsGridView({super.key});

  @override
  State<TrendingDealsGridView> createState() => _TrendingDealsGridViewState();
}

class _TrendingDealsGridViewState extends State<TrendingDealsGridView> {
  final List<TrendingDealsItem> trendingDealsItems = [
    const TrendingDealsItem(
      itemImagePath: Assets.assetsImagesPngsAvocadoImage,
      itemName: 'Avocado',
      itemPrice: 6.7,
    ),
    const TrendingDealsItem(
      itemImagePath: Assets.assetsImagesPngsBrocoliImage,
      itemName: 'Brocoli',
      itemPrice: 8.7,
    ),
    const TrendingDealsItem(
      itemImagePath: Assets.assetsImagesPngsTomatoesImage,
      itemName: 'Tomatoes',
      itemPrice: 4.9,
    ),
    const TrendingDealsItem(
      itemImagePath: Assets.assetsImagesPngsGrapesImage,
      itemName: 'Grapes',
      itemPrice: 7.2,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(
        itemCount: trendingDealsItems.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return trendingDealsItems[index];
        },
      ),
    );
  }
}
