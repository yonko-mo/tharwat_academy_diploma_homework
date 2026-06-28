import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text.rich(
        TextSpan(
          text: 'By tapping Sign up you accept all ',
          style: AppStyles.termsAndConditionsStyle,
          children: [
            TextSpan(
              text: 'terms',
              style: AppStyles.termsAndConditionsLinkStyle,
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'condition',
              style: AppStyles.termsAndConditionsLinkStyle,
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
