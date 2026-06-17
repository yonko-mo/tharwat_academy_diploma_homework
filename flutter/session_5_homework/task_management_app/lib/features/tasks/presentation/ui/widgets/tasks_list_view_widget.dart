import 'package:flutter/material.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/ui/widgets/task_item.dart';

class TasksListViewWidget extends StatelessWidget {
  final List<TaskModel> tasks;

  const TasksListViewWidget({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskItem(task: tasks[index]);
      },
    );
  }
}
