// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/app_constants.dart';
import 'package:grocery_app/core/shared_preferences_singleton.dart';
import 'package:grocery_app/core/constants/assets.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';
import 'package:grocery_app/core/widgets/custom_button.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_cubit.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_state.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/registration_success_dialog.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/terms_and_conditions_text.dart';
import 'package:grocery_app/features/authentication/widgets/auth_background.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  bool _obscurePassword = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            SharedPreferencesSingleton.instance.setBool(
              AppConstants.onboardingSeen,
              true,
            );
            showSnackBar(context, 'registration success');
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => RegistrationSuccessDialog(
                userName: state.userName,
              ),
            );
          } else if (state is RegisterError) {
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
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AuthHeader(
                              title: 'Create your account',
                              onClose: () => Navigator.of(context).pop(),
                            ),
                            const SizedBox(height: 50),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextFormField(
                                    hintText: 'First Name',
                                    onChanged: (data) {
                                      firstName = data;
                                    },
                                    validator: Validators.validateName,
                                  ),
                                ),
                                const SizedBox(width: 19),
                                Expanded(
                                  child: CustomTextFormField(
                                    hintText: 'Last Name',
                                    onChanged: (data) {
                                      lastName = data;
                                    },
                                    validator: Validators.validateName,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            CustomTextFormField(
                              hintText: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (data) {
                                email = data;
                              },
                              validator: Validators.validateEmail,
                            ),
                            const SizedBox(height: 13),
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
                            const SizedBox(height: 10),
                            const TermsAndConditionsText(),
                            const SizedBox(height: 32),
                            CustomButton(
                              text: 'CREATE AN ACCOUNT',
                              isLoading: state is RegisterLoading,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<RegisterCubit>().register(
                                        email: email!,
                                        password: password!,
                                        firstName: firstName!,
                                        lastName: lastName!,
                                      );
                                } else {
                                  showSnackBar(
                                      context, 'please try again');
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
