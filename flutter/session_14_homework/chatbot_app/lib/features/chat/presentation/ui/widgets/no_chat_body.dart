import 'package:chatbot_app/core/constants/assets.dart';
import 'package:chatbot_app/features/chat/data/models/category_model.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/category_section.dart';
import 'package:flutter/material.dart';

class NoChatBody extends StatelessWidget {
  const NoChatBody({super.key});

  final List<Category> categories = const [
    Category(
      name: 'Explain',
      icon: Assets.explainIcon,
      items: [
        'Explain Quantum physics',
        'What are wormholes explain like i am 5',
      ],
    ),
    Category(
      name: 'Write and Edit',
      icon: Assets.writeAndEditIcon,
      items: [
        'Write a tweet about global warming',
        'Write a poem about flower and love',
        'Write a rap song lyrics about',
      ],
    ),
    Category(
      name: 'Translate',
      icon: Assets.translateIcon,
      items: [
        'How do you say "how are you" in korean?',
        'Write a poem about flower and love',
        'Write a rap song lyrics about',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19.0),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategorySection(
            categoryName: category.name,
            categoryIcon: category.icon,
            items: category.items,
          );
        },
      ),
    );
  }
}
