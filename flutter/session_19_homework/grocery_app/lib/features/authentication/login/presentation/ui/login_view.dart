// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';
import 'package:grocery_app/core/theme/app_colors.dart';
import 'package:grocery_app/core/widgets/custom_button.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';
import 'package:grocery_app/features/home/presentation/ui/home_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  bool _obscurePassword = true;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Stack(
          children: [
            AuthBackground(
              height: MediaQuery.sizeOf(context).height * 0.4,
              onBack: () => Navigator.of(context).pop(),
              imagePath: Assets.assetsImagesPngsSigninImage,
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
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AuthHeader(
                          title: 'Sign In',
                          onClose: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(height: 32),
                        CustomTextFormField(
                          hintText: 'Email Address',
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (data) {
                            email = data;
                          },
                          validator: Validators.validateEmail,
                        ),
                        const SizedBox(height: 12),
                        CustomTextFormField(
                          obscureText: _obscurePassword,
                          hintText: 'Password',
                          onChanged: (data) {
                            password = data;
                          },
                          validator: Validators.validatePassword,
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
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 42),
                        CustomButton(
                          text: 'SIGN IN',
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              isLoading = true;
                              setState(() {});
                              try {
                                await signInUser();
                                showSnackBar(context, 'login success');
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomeView(),
                                  ),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  showSnackBar(
                                    context,
                                    'No user found for that email.',
                                  );
                                } else if (e.code == 'wrong-password') {
                                  showSnackBar(
                                    context,
                                    'Wrong password provided for that user.',
                                  );
                                } else {
                                  showSnackBar(
                                    context,
                                    e.message ?? 'Authentication failed.',
                                  );
                                }
                              } catch (e) {
                                showSnackBar(
                                  context,
                                  'Something went wrong. Please try again.',
                                );
                              }
                              isLoading = false;
                              setState(() {});
                            } else {
                              showSnackBar(context, 'please try again');
                            }
                          },
                        ),
                        const SizedBox(height: 37),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
