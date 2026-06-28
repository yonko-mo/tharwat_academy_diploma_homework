// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';

import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_cubit.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_state.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';
import 'package:grocery_app/features/home/presentation/ui/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String? email;
  String? password;
  bool _obscurePassword = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            SharedPreferencesSingleton.instance.setBool(
              AppConstants.onboardingSeen,
              true,
            );
            showSnackBar(context, 'login success');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeView()),
            );
          } else if (state is LoginError) {
            showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
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
                                  style: AppStyles.forgotPasswordStyle,
                                ),
                              ),
                            ),
                            const SizedBox(height: 42),
                            CustomElevatedButton(
                              text: 'SIGN IN',
                              isLoading: state is LoginLoading,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().signIn(
                                    email!,
                                    password!,
                                  );
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
          );
        },
      ),
    );
  }
}
