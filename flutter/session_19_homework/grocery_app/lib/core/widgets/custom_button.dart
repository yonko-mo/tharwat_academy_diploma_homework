import 'package:flutter/material.dart';
import 'package:grocery_app/core/theme/app_colors.dart';
import 'package:grocery_app/core/theme/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool withArrow;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderSide? border;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.withArrow = false,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: border ?? BorderSide.none,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.5,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    text,
                    style: AppStyles.buttonTextStyle.copyWith(
                      color: textColor ?? AppStyles.buttonTextStyle.color,
                    ),
                  ),
                  const Spacer(),
                  withArrow
                      ? Icon(
                          Icons.arrow_forward,
                          color: textColor ?? Colors.white,
                          size: 24,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
      ),
    );
  }
}
