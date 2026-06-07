import 'package:chatbot_app/features/chat/presentation/ui/widgets/chatbot_answer.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/user_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbot_app/features/chat/presentation/cubit/send%20message/send_message_cubit.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        final messages = context.read<SendMessageCubit>().messages;

        return ListView.separated(
          padding: const EdgeInsets.only(bottom: 80),
          itemCount:
              messages.length + (state is SendMessageLoadingState ? 1 : 0),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            if (index == messages.length) {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              );
            }

            final message = messages[index];
            final text = message.parts.isNotEmpty ? message.parts[0].text : '';

            if (message.role == 'user') {
              return UserQuestion(question: text);
            } else {
              return ChatbotAnswer(answer: text);
            }
          },
        );
      },
    );
  }
}
