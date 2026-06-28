import 'package:flutter/material.dart';

import 'package:grocery_app/core/theme/app_styles.dart';

class AdItem extends StatelessWidget {
  final String assetName;
  final String title;
  const AdItem({super.key, required this.assetName, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.70,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(assetName),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        Positioned(
          bottom: 21,
          left: 20,
          child: Text(
            title,
            style: AppStyles.adTitleStyle,
          ),
        ),
      ],
    );
  }
}
