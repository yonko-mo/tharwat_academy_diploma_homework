import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_cubit.dart';
import 'package:grocery_app/features/authentication/login/presentation/cubits/login_state.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';

class LoginForm extends StatefulWidget {
  final LoginState state;
  const LoginForm({super.key, required this.state});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
            onChanged: (data) => _email = data,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 12),
          CustomTextFormField(
            obscureText: _obscurePassword,
            hintText: 'Password',
            onChanged: (data) => _password = data,
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
            isLoading: widget.state is LoginLoadingState,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<LoginCubit>().signIn(_email!, _password!);
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
