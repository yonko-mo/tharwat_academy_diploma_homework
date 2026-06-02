import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SuggestionItem extends StatelessWidget {
  final String title;

  const SuggestionItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      width: double.infinity,
      decoration: ShapeDecoration(
        color: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyles.suggestionStyle,
      ),
    );
  }
}
