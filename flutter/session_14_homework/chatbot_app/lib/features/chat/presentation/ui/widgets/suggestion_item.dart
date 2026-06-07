import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionItem extends StatelessWidget {
  final String title;

  const SuggestionItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SendMessageCubit>().sendMessage(title);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.5, horizontal: 16),
        width: MediaQuery.of(context).size.width,
        decoration: ShapeDecoration(
          color: AppColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 284),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: AppStyles.suggestionStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

