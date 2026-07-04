import 'package:flutter/material.dart';
import 'package:grocery_app/features/authentication/presentation/ui/widgets/custom_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;

  const PasswordTextFormField({
    super.key,
    this.onChanged,
    this.validator,
  });

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: _obscurePassword,
      hintText: 'Password',
      onChanged: widget.onChanged,
      validator: widget.validator,
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
    );
  }
}
