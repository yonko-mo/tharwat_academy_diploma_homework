import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_colors.dart';
import 'package:grocery_app/core/widgets/custom_button.dart';

class RegistrationSuccessDialog extends StatelessWidget {
  final String userName;

  const RegistrationSuccessDialog({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 29.0),
      child: Container(
        width: 333,
        height: 461,
        decoration: ShapeDecoration(
          color: const Color(0xFFF2F2F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 29.0, vertical: 37.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Center(
              child: Text(
                'Congratulations!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFFE67F1E),
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                userName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF7A1E76),
                  fontSize: 12.92,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 1.09,
                ),
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'SIGN IN',
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
