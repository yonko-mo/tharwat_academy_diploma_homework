import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final String categoryName;
  final String categoryIcon;
  final List<String> items;

  const CategorySection({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(categoryIcon, width: 24, height: 24),
        const SizedBox(height: 5),
        Text(
          categoryName,
          style: AppStyles.heading1.copyWith(
            fontSize: 15,
            color: AppColors.suggestionColor,
          ),
        ),
        const SizedBox(height: 18),
        ...List.generate(
          items.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SuggestionItem(title: items[index]),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
