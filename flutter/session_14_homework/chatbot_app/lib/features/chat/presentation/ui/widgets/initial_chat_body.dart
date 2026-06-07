import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/suggestion_section_item.dart';
import 'package:flutter/material.dart';

class InitialChatBody extends StatelessWidget {
  const InitialChatBody({super.key});

  final List<SuggestionsSectionItem> categories = const [
    SuggestionsSectionItem(
      categoryName: 'Explain',
      categoryIcon: Assets.explainIcon,
      suggestions: [
        'Explain Quantum physics',
        'What are wormholes explain like i am 5',
      ],
    ),
    SuggestionsSectionItem(
      categoryName: 'Write and Edit',
      categoryIcon: Assets.writeAndEditIcon,
      suggestions: [
        'Write a tweet about global warming',
        'Write a poem about flower and love',
        'Write a rap song lyrics about',
      ],
    ),
    SuggestionsSectionItem(
      categoryName: 'Translate',
      categoryIcon: Assets.translateIcon,
      suggestions: [
        'How do you say "how are you" in korean?',
        'Write a poem about flower and love',
        'Write a rap song lyrics about',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return SuggestionsSectionItem(
          categoryName: category.categoryName,
          categoryIcon: category.categoryIcon,
          suggestions: category.suggestions,
        );
      },
    );
  }
}
