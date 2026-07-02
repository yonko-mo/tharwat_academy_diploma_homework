import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/core/helper/show_snack_bar.dart';
import 'package:grocery_app/core/helper/validators.dart';
import 'package:grocery_app/core/widgets/custom_elevated_button.dart';
import 'package:grocery_app/features/authentication/domain/models/user_model.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/cubits/create_account_cubit.dart';
import 'package:grocery_app/features/authentication/create_account/presentation/ui/widgets/terms_and_conditions_text.dart';
import 'package:grocery_app/features/authentication/widgets/auth_header.dart';
import 'package:grocery_app/features/authentication/widgets/custom_text_form_field.dart';
import 'package:grocery_app/features/authentication/widgets/password_text_form_field.dart';

class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({super.key});

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  String? _firstName;
  String? _lastName;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AuthHeader(
            title: 'Create your account',
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
          PasswordTextFormField(
            onChanged: (data) => _password = data,
            validator: Validators.validatePassword,
          ),
          const SizedBox(height: 10),
          const TermsAndConditionsText(),
          const SizedBox(height: 32),
          CustomElevatedButton(
            text: 'CREATE AN ACCOUNT',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final user = UserModel(
                  firstName: _firstName!,
                  lastName: _lastName!,
                  email: _email!,
                );
                context.read<CreateAccountCubit>().createAccount(
                  user: user,
                  password: _password!,
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
