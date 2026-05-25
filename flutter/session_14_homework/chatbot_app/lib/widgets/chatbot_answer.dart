import 'package:chatbot_app/constants/assets.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ChatbotAnswer extends StatelessWidget {
  final String answer;
  const ChatbotAnswer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(245.28),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 1.96,
                offset: Offset(0, 1.96),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 4.91,
            children: [
              Container(
                width: 11.77,
                height: 17.66,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.blueRobotIcon),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 7),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
            decoration: const ShapeDecoration(
              color: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
            child: Text(
              answer,
              style: AppTextStyles.heading1.copyWith(
                fontSize: 13,
                color: AppColors.chatbotAnswerColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
