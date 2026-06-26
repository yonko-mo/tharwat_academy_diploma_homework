import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/widgets/custom_button.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/terms_and_conditions_text.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/registration_success_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthBackground(
            height: MediaQuery.sizeOf(context).height * 0.4,
            onBack: () => Navigator.of(context).pop(),
            imagePath: Assets.assetsImagesPngsRegisterImage,
          ),
          Positioned(
            top: MediaQuery.sizeOf(context).height * 0.35,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 29.0,
                  vertical: 37.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AuthHeader(
                      title: 'Create your account',
                      onClose: () => Navigator.of(context).pop(),
                    ),
                    const SizedBox(height: 50),
                    const Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(hintText: 'First Name'),
                        ),
                        SizedBox(width: 19),
                        Expanded(
                          child: CustomTextFormField(hintText: 'Last Name'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const CustomTextFormField(
                      hintText: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 13),
                    CustomTextFormField(
                      obscureText: _obscurePassword,
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    const TermsAndConditionsText(),
                    const SizedBox(height: 32),
                    CustomButton(
                      text: 'CREATE AN ACCOUNT',
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => const RegistrationSuccessDialog(
                            userName: 'Md Rafatul Islam',
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 37),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
