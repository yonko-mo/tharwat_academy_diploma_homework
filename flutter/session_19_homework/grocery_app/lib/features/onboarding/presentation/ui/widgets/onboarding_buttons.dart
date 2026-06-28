import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';

class OnboardingButtons extends StatelessWidget {
  final int currentPage;
  final int itemCount;
  final VoidCallback onNextPressed;
  final VoidCallback onCreateAccountPressed;
  final VoidCallback onLoginPressed;

  const OnboardingButtons({
    super.key,
    required this.currentPage,
    required this.itemCount,
    required this.onNextPressed,
    required this.onCreateAccountPressed,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (currentPage == itemCount - 1) {
      return Column(
        children: [
          CustomElevatedButton(
            text: 'CREATE AN ACCOUNT',
            backgroundColor: Colors.black,
            textColor: Colors.white,
            onPressed: onCreateAccountPressed,
          ),
          const SizedBox(height: 18),
          CustomElevatedButton(
            text: 'LOGIN',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            border: const BorderSide(color: Colors.black, width: 2),
            onPressed: onLoginPressed,
          ),
        ],
      );
    }

    return CustomElevatedButton(text: 'NEXT', onPressed: onNextPressed);
  }
}
