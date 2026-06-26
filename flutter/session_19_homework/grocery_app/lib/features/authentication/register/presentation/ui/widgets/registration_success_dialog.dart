import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_colors.dart';
import 'package:grocery_app/core/theme/app_styles.dart';
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
          color: AppColors.lightGrayBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          shadows: const [
            BoxShadow(
              color: AppColors.dialogShadowColor,
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
                style: AppStyles.dialogTitleStyle,
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                userName,
                textAlign: TextAlign.center,
                style: AppStyles.dialogUserNameStyle,
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
