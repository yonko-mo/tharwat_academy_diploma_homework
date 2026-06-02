import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static const TextStyle heading1 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 23,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle heading2 = TextStyle(
    color: AppColors.onBoardingDescriptionColor,
    fontSize: 15,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
  );

  static const TextStyle suggestionStyle = TextStyle(
    color: AppColors.suggestionColor,
    fontSize: 15,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w500,
  );
}
