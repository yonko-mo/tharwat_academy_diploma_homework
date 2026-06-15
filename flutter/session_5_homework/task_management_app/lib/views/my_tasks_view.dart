import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_management.dart';
import 'package:task_management_app/widgets/empty_tasks_widget.dart';
import 'package:task_management_app/widgets/task_text_field_widget.dart';
import 'package:task_management_app/widgets/tasks_list_view_widget.dart';

class MyTasksView extends StatefulWidget {
  const MyTasksView({super.key});

  @override
  State<MyTasksView> createState() => _MyTasksViewState();
}

class _MyTasksViewState extends State<MyTasksView> {
  final TaskManagement taskManagement = TaskManagement();

  void updateTasks() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9ef2e3),
        title: const Text(
          'My Tasks',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: taskManagement.tasks.isEmpty
                ? const Center(child: EmptyTasksWidget())
                : TasksListViewWidget(
                    taskManagement: taskManagement,
                    updateTasks: updateTasks,
                  ),
          ),
          TaskTextFieldWidget(
            taskManagement: taskManagement,
            updateTasks: updateTasks,
          ),
        ],
      ),
    );
  }
}
