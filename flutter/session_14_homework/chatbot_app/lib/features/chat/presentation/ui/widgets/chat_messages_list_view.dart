import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chatbot_answer.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/user_question.dart';
import 'package:flutter/material.dart';

class ChatMessagesListView extends StatelessWidget {
  final List<ContentModel> messages;
  const ChatMessagesListView({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 72),
      reverse: true,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        var newIndex = messages.length - (index + 1);
        final message = messages[newIndex];
        if (message.role == 'user') {
          return UserQuestion(question: message.parts.first.text);
        } else {
          return ChatbotAnswer(answer: message.parts.first.text);
        }
      },
    );
  }
}
