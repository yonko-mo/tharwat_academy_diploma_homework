import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_management.dart';
import 'package:task_management_app/widgets/task_widget.dart';

class TasksListViewWidget extends StatefulWidget {
  final TaskManagement taskManagement;
  final void Function() updateTasks;

  const TasksListViewWidget({
    super.key,
    required this.taskManagement,
    required this.updateTasks,
  });

  @override
  State<TasksListViewWidget> createState() => _TasksListViewWidgetState();
}

class _TasksListViewWidgetState extends State<TasksListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.taskManagement.tasksCount,
      itemBuilder: (context, index) {
        return TaskWidget(
          task: widget.taskManagement.tasks[index],
          tasks: widget.taskManagement.tasks,
          onDelete: () {
            widget.taskManagement.removeTask(widget.taskManagement.tasks[index]);
            if (widget.taskManagement.isEmpty) {
              widget.updateTasks();
            } else {
              setState(() {});
            }
          },
        );
      },
    );
  }
}
