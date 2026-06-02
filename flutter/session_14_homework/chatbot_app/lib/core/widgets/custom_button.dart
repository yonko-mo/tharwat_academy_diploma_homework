import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool withArrow;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.withArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              text,
              style: AppStyles.heading1.copyWith(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            withArrow
                ? const Icon(Icons.arrow_forward, color: Colors.white, size: 24)
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
