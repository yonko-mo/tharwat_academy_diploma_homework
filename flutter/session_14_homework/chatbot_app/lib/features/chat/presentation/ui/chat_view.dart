import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_body.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chat_input_field.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/no_chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chatbot_app/features/chat/data/services/gemini_service.dart';
import 'package:dio/dio.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(geminiService: GeminiService(Dio())),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 17.0),
              child: Row(
                children: [
                  Image.asset(Assets.blueRobotIcon, width: 24, height: 36),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gemini',
                        style: AppStyles.heading1.copyWith(fontSize: 20),
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
                            style: AppStyles.heading2.copyWith(
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
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<ChatCubit, ChatState>(
                    builder: (context, state) {
                      final cubit = context.read<ChatCubit>();
                      if (cubit.messages.isEmpty) {
                        return const NoChatBody();
                      }
                      return const ChatBody();
                    },
                  ),
                ),
                const ChatInputField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
