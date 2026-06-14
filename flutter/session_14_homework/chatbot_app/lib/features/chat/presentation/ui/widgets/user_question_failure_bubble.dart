import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class UserQuestionFailureBubble extends StatelessWidget {
  final String question;
  final String errorMessage;
  final VoidCallback onRetry;

  const UserQuestionFailureBubble({
    super.key,
    required this.question,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, color: Colors.red, size: 14),
        const SizedBox(width: 4),
        Flexible(
          flex: 0,
          child: Text(
            errorMessage,
            style: AppStyles.heading1.copyWith(
              fontSize: 11,
              color: Colors.red,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 4),
        GestureDetector(
          onTap: onRetry,
          child: const Icon(Icons.refresh, color: Colors.blue, size: 16),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            decoration: const ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            child: Text(
              question,
              style: AppStyles.heading1.copyWith(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

