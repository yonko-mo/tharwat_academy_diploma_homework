import 'package:flutter/material.dart';
import 'package:grocery_app/features/authentication/presentation/ui/widgets/sign_in_form.dart';

class SignInBottomSheet extends StatelessWidget {
  const SignInBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 29.0,
          vertical: 37.0,
        ),
        child: SignInForm(),
      ),
    );
  }
}
