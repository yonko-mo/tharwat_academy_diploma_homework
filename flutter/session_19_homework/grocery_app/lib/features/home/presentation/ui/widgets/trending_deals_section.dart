import 'package:flutter/material.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/section_header.dart';
import 'package:grocery_app/features/home/presentation/ui/widgets/trending_deals_grid_view.dart';

class TrendingDealsSection extends StatelessWidget {
  const TrendingDealsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SectionHeader(title: 'Trending Deals'),
        SizedBox(height: 13),
        TrendingDealsGridView(),
      ],
    );
  }
}
