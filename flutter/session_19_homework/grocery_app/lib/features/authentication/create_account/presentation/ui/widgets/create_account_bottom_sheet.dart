import 'package:flutter/material.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/ui/widgets/create_account_form.dart';

class CreateAccountBottomSheet extends StatelessWidget {
  const CreateAccountBottomSheet({super.key});

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
        child: CreateAccountForm(),
      ),
    );
  }
}
