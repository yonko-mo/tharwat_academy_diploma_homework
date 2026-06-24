import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/theme/app_colors.dart';
import 'package:task_management_app/core/theme/app_styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/delete_task/delete_task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/tasks/tasks_cubit.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 1),
      color: AppColors.taskCardBackground,
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            task.toggleCompletion();
            task.save();
            BlocProvider.of<TasksCubit>(context).fetchAllTasks();
          },
          icon: Icon(
            task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
            color: AppColors.taskIcon,
          ),
        ),
        title: Text(
          task.title,
          style: task.isCompleted
              ? AppStyles.completedTaskTitle
              : AppStyles.taskTitle,
        ),
        subtitle: Text('Created: ${task.date}'),
        trailing: IconButton(
          onPressed: () {
            BlocProvider.of<DeleteTaskCubit>(context).deleteTask(task);
          },
          icon: const Icon(Icons.delete_outline, color: AppColors.deleteIcon),
        ),
      ),
    );
  }
}
