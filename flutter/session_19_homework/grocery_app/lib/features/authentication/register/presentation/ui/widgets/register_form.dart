import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_cubit.dart';
import 'package:grocery_app/features/authentication/register/presentation/cubits/register_state.dart';
import 'package:grocery_app/features/authentication/register/presentation/ui/widgets/terms_and_conditions_text.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  final RegisterState state;
  const RegisterForm({super.key, required this.state});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
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
                  onChanged: (data) => _firstName = data,
                  validator: Validators.validateName,
                ),
              ),
              const SizedBox(width: 19),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Last Name',
                  onChanged: (data) => _lastName = data,
                  validator: Validators.validateName,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            onChanged: (data) => _email = data,
            validator: Validators.validateEmail,
          ),
          const SizedBox(height: 13),
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
          const SizedBox(height: 10),
          const TermsAndConditionsText(),
          const SizedBox(height: 32),
          CustomElevatedButton(
            text: 'CREATE AN ACCOUNT',
            isLoading: widget.state is RegisterLoadingState,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.read<RegisterCubit>().register(
                  email: _email!,
                  password: _password!,
                  firstName: _firstName!,
                  lastName: _lastName!,
                );
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
