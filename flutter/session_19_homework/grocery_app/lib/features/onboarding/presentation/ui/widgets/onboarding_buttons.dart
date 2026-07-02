import 'package:flutter/material.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/ui/create_account_view.dart';
import 'package:grocery_app/features/authentication/sign%20in/presentation/ui/sign_in_view.dart';

class OnboardingButtons extends StatelessWidget {
  final int currentPage;
  final int itemCount;
  final VoidCallback onNextPressed;

  const OnboardingButtons({
    super.key,
    required this.currentPage,
    required this.itemCount,
    required this.onNextPressed,
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
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreateAccountView(),
                ),
              );
            },
          ),
          const SizedBox(height: 18),
          CustomElevatedButton(
            text: 'LOGIN',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            border: const BorderSide(color: Colors.black, width: 2),
            onPressed: (){
               Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SignInView()),
              );
            },
          ),
        ],
      );
    }

    return CustomElevatedButton(text: 'NEXT', onPressed: onNextPressed);
  }
}
