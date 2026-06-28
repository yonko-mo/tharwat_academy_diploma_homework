import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_styles.dart';

class TrendingDealsItem extends StatelessWidget {
  final String itemImagePath;
  final String itemName;
  final double itemPrice;
  const TrendingDealsItem({
    super.key,
    required this.itemImagePath,
    required this.itemName,
    required this.itemPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(itemImagePath),
          fit: BoxFit.cover,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 14,
            bottom: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName, style: AppStyles.trendingItemNameStyle),
                const SizedBox(height: 6),
                Text('\$$itemPrice', style: AppStyles.trendingItemPriceStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
