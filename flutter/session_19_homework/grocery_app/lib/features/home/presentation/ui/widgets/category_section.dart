import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/categories_list_view.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/section_header.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(title: 'Categories', onPressed: () {}),
        const SizedBox(height: 13),
        const CategoriesListView(),
      ],
    );
  }
}
