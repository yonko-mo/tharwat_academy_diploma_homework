import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/trending_deals_item.dart';

class TrendingDealsGridView extends StatelessWidget {
  const TrendingDealsGridView({super.key});

  static const List<({String imagePath, String name, double price})> _items = [
    (
      imagePath: Assets.assetsImagesPngsAvocadoImage,
      name: 'Avocado',
      price: 6.7,
    ),
    (
      imagePath: Assets.assetsImagesPngsBrocoliImage,
      name: 'Brocoli',
      price: 8.7,
    ),
    (
      imagePath: Assets.assetsImagesPngsTomatoesImage,
      name: 'Tomatoes',
      price: 4.9,
    ),
    (imagePath: Assets.assetsImagesPngsGrapesImage, name: 'Grapes', price: 7.2),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.9,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => TrendingDealsItem(
          itemImagePath: _items[index].imagePath,
          itemName: _items[index].name,
          itemPrice: _items[index].price,
        ),
        childCount: _items.length,
      ),
    );
  }
}
