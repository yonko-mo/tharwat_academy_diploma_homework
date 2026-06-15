import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskWidget extends StatefulWidget {
  final TaskModel task;
  final List<TaskModel> tasks;
  final void Function() onDelete;

  const TaskWidget({super.key, required this.task, required this.tasks, required this.onDelete});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 1),
      color: const Color(0xffeff5f3),
      child: ListTile(
        leading: IconButton(
          onPressed: () {
            widget.task.isCompleted = !widget.task.isCompleted;
            setState(() {});
          },
          icon: Icon(
            widget.task.isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: const Color(0xff016c61),
          ),
        ),
        title: Text(
          widget.task.title,
          style: TextStyle(
            color: widget.task.isCompleted
                ? const Color(0xff6f7573)
                : const Color(0xff1b1e1e),
            decoration: widget.task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationThickness: 2,
            fontWeight: widget.task.isCompleted
                ? FontWeight.normal
                : FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          'Created: ${widget.task.date}',
        ),
        trailing: IconButton(
          onPressed: widget.onDelete,
          icon: const Icon(Icons.delete_outline, color: Colors.red),
        ),
      ),
    );
  }
}
