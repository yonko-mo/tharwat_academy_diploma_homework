import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/features/chat/data/models/content_model.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/suggestion_section_item.dart';
import 'package:flutter/material.dart';

class InitialChatBody extends StatelessWidget {
  final List<ContentModel> messages;
  const InitialChatBody({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categoriesData = [
      {
        'categoryName': 'Explain',
        'categoryIcon': Assets.explainIcon,
        'suggestions': [
          'Explain Quantum physics',
          'What are wormholes explain like i am 5',
        ],
      },
      {
        'categoryName': 'Write and Edit',
        'categoryIcon': Assets.writeAndEditIcon,
        'suggestions': [
          'Write a tweet about global warming',
          'Write a poem about flower and love',
          'Write a rap song lyrics about',
        ],
      },
      {
        'categoryName': 'Translate',
        'categoryIcon': Assets.translateIcon,
        'suggestions': [
          'How do you say "how are you" in korean?',
          'Write a poem about flower and love',
          'Write a rap song lyrics about',
        ],
      },
    ];

    return ListView.builder(
      itemCount: categoriesData.length,
      itemBuilder: (context, index) {
        final category = categoriesData[index];
        return SuggestionsSectionItem(
          categoryName: category['categoryName'] as String,
          categoryIcon: category['categoryIcon'] as String,
          suggestions: category['suggestions'] as List<String>,
          messages: messages,
        );
      },
    );
  }
}

