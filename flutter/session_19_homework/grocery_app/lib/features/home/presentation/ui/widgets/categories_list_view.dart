import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/category_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  static const List<String> _imagePaths = [
    Assets.assetsImagesPngsFruitsImage,
    Assets.assetsImagesPngsMushroomImage,
    Assets.assetsImagesPngsDairyImage,
    Assets.assetsImagesPngsOatsImage,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.8,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _imagePaths.length,
        itemBuilder: (context, index) =>
            CategoryItem(imagePath: _imagePaths[index]),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
