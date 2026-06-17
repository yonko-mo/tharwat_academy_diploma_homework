import 'package:flutter/material.dart';
import 'package:task_management_app/core/theme/app_colors.dart';

class AppStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  static const TextStyle taskTitle = TextStyle(
    color: AppColors.taskTitle,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const TextStyle completedTaskTitle = TextStyle(
    color: AppColors.completedTaskTitle,
    decoration: TextDecoration.lineThrough,
    decorationThickness: 2,
    fontWeight: FontWeight.normal,
    fontSize: 18,
  );

  static const TextStyle inputHint = TextStyle(
    color: AppColors.inputHint,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle emptyTitle = TextStyle(
    color: AppColors.emptyTitle,
    fontSize: 24,
  );

  static const TextStyle emptySubtitle = TextStyle(
    fontSize: 16,
    color: AppColors.emptySubtitle,
    fontWeight: FontWeight.bold,
  );
}
