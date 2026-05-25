import 'package:chatbot_app/constants/assets.dart';
import 'package:chatbot_app/widgets/category_section.dart';
import 'package:flutter/material.dart';

class NoChatBody extends StatelessWidget {
  const NoChatBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategorySection(
          categoryName: 'Explain',
          categoryIcon: Assets.explainIcon,
          items: [
            'Explain Quantum physics',
            'What are wormholes explain like i am 5',
          ],
        ),
        CategorySection(
          categoryName: 'Write and Edit',
          categoryIcon: Assets.writeAndEditIcon,
          items: [
            'Write a tweet about global warming',
            'Write a poem about flower and love',
            'Write a rap song lyrics about',
          ],
        ),
        CategorySection(
          categoryName: 'Translate',
          categoryIcon: Assets.translateIcon,
          items: [
            'How do you say “how are you” in korean?',
            'Write a poem about flower and love',
            'Write a rap song lyrics about',
          ],
        ),
      ],
    );
  }
}
