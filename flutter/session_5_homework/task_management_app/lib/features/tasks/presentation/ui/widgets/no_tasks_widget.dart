import 'package:flutter/material.dart';
import 'package:task_management_app/core/theme/app_colors.dart';
import 'package:task_management_app/core/theme/app_styles.dart';

class NoTasksWidget extends StatelessWidget {
  const NoTasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.task_alt, size: 100, color: AppColors.emptyIcon),
        SizedBox(height: 16),
        Text('No tasks yet!', style: AppStyles.emptyTitle),
        SizedBox(height: 10),
        Text('Add a task to get started.', style: AppStyles.emptySubtitle),
      ],
    );
  }
}
