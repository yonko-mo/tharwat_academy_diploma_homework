import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel task;

  const TaskWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 1),
      color: const Color(0xffeff5f3),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            task.isCompleted = !task.isCompleted;
            task.save();
            BlocProvider.of<TasksCubit>(context).fetchAllTasks();
          },
          icon: Icon(
            task.isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: const Color(0xff016c61),
          ),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            color: task.isCompleted
                ? const Color(0xff6f7573)
                : const Color(0xff1b1e1e),
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            fontWeight: task.isCompleted
                ? FontWeight.normal
                : FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Created: ${task.date}',
        ),
        trailing: IconButton(
          onPressed: () {
            task.delete();
            BlocProvider.of<TasksCubit>(context).fetchAllTasks();
          },
          icon: const Icon(Icons.delete_outline, color: Colors.red),
        ),
      ),
    );
  }
}
