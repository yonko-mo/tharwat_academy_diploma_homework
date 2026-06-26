import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_colors.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        TextSpan(
          text: 'By tapping Sign up you accept all ',
          style: TextStyle(
            color: Color(0xFF2F2F2F),
            fontSize: 14,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(
              text: 'terms',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'condition',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
