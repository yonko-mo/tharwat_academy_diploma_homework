import 'package:chatbot_app/widgets/chatbot_answer.dart';
import 'package:chatbot_app/widgets/user_question.dart';
import 'package:flutter/material.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key});

  static const List<Map<String, String>> messages = [
    {'type': 'user', 'content': 'Hello Gemini, how are you today?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
    {'type': 'bot', 'content': 'Hello,i\'m fine,how can i help you?'},
  ];

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        UserQuestion(question: 'Hello Gemini, how are you today?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
        ChatbotAnswer(answer: 'Hello,i’m fine,how can i help you?'),
        SizedBox(height: 27),
      ],
    );
  }
}
