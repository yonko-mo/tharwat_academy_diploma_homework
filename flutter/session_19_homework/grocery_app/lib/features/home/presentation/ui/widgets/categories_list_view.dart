import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/category_item.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  final List<CategoryItem> categories = const [
    CategoryItem(imagePath: Assets.assetsImagesPngsFruitsImage),
    CategoryItem(imagePath: Assets.assetsImagesPngsMushroomImage),
    CategoryItem(imagePath: Assets.assetsImagesPngsDairyImage),
    CategoryItem(imagePath: Assets.assetsImagesPngsOatsImage),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 73,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            CategoryItem(imagePath: categories[index].imagePath),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
      ),
    );
  }
}
