import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/sign in/presentation/cubits/sign_in_cubit.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';
import 'package:grocery_app/features/authentication/widgets/password_text_form_field.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(title: 'Sign In'),
          const SizedBox(height: 32),
          CustomTextFormField(
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            onChanged: (data) => _email = data,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 12),
          PasswordTextFormField(
            onChanged: (data) => _password = data,
            validator: Validators.validatePassword,
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Forgot Password?',
                style: AppStyles.forgotPasswordStyle,
              ),
            ),
          ),
          const SizedBox(height: 42),
          CustomElevatedButton(
            text: 'SIGN IN',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<SignInCubit>().signIn(_email!, _password!);
              } else {
                showSnackBar(context, 'please try again');
              }
            },
          ),
          const SizedBox(height: 37),
        ],
      ),
    );
  }
}
