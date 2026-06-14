import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chatbot_answer.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/chatbot_loading_bubble.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/user_question.dart';
import 'package:flutter/material.dart';

class ChatMessagesLoadingListView extends StatelessWidget {
  final List<ContentModel> messages;
  const ChatMessagesLoadingListView({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 72),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      reverse: true,
      itemCount: messages.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const ChatbotLoadingBubble();
        }
        var newIndex = messages.length - index;
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
