import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_colors.dart';

class AppStyles {
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle titleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.09,
  );

  static const TextStyle subtitleTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.35,
  );

  static final TextStyle bodyTextStyle = TextStyle(
    color: Colors.black.withValues(alpha: 0.70),
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w300,
    height: 1.57,
  );

  static const authHeaderStyle = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const textFormFieldStyle = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle forgotPasswordStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 14,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle homeGoodMorningStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static const TextStyle homeUserNameStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle textFormFieldHintStyle = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle termsAndConditionsStyle = TextStyle(
    color: AppColors.darkGray,
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );

  static const TextStyle dialogTitleStyle = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 24,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static const TextStyle dialogUserNameStyle = TextStyle(
    color: AppColors.accentPurple,
    fontSize: 12.92,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    height: 1.09,
  );

  static const TextStyle sectionHeaderStyle = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle adTitleStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle termsAndConditionsLinkStyle = TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
}
