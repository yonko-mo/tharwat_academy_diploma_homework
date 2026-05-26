import 'package:chatbot_app/constants/assets.dart';
import 'package:chatbot_app/constants/colors.dart';
import 'package:chatbot_app/constants/text_styles.dart';
import 'package:chatbot_app/widgets/chat_body.dart';
import 'package:chatbot_app/widgets/chat_input_field.dart';
import 'package:chatbot_app/widgets/no_chat_body.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(Assets.blueRobotIcon, width: 24, height: 36),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gemini',
                    style: AppTextStyles.heading1.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 1),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const ShapeDecoration(
                          color: AppColors.statusColor,
                          shape: OvalBorder(),
                        ),
                      ),
                      const SizedBox(width: 8.5),
                      Text(
                        'Online',
                        style: AppTextStyles.heading2.copyWith(
                          fontSize: 17,
                          color: AppColors.statusColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        body: const SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(29.0),
                  child: NoChatBody(),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 29, right: 29),
                  child: ChatInputField(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
