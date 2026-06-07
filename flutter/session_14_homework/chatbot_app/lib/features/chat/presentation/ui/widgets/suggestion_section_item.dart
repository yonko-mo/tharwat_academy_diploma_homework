import 'package:chatbot_app/core/theme/app_colors.dart';
import 'package:chatbot_app/core/theme/app_styles.dart';
import 'package:chatbot_app/features/chat/presentation/ui/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';

class SuggestionsSectionItem extends StatelessWidget {
  final String categoryName;
  final String categoryIcon;
  final List<String> suggestions;

  const SuggestionsSectionItem({
    super.key,
    required this.categoryName,
    required this.categoryIcon,
    required this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          const SizedBox(height: 10),
          ...suggestions.map(
            (suggestion) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SuggestionItem(title: suggestion),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

