import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chatbot_answer.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/user_question.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  final List<ContentModel> messages;
  final bool isLoading;

  const ChatBody({super.key, required this.messages, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 80),
      itemCount: messages.length + (isLoading ? 1 : 0),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        if (index == messages.length) {
          return const Align(
            alignment: Alignment.centerLeft,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        }

        final message = messages[index];
        final text = message.parts.first.text;

        if (message.role == 'user') {
          return UserQuestion(question: text);
        } else {
          return ChatbotAnswer(answer: text);
        }
      },
    );
  }
}
