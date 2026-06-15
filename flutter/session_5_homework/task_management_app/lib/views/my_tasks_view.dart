import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_management_app/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:task_management_app/widgets/empty_tasks_widget.dart';
import 'package:task_management_app/widgets/task_text_field_widget.dart';
import 'package:task_management_app/widgets/tasks_list_view_widget.dart';

class MyTasksView extends StatefulWidget {
  const MyTasksView({super.key});

  @override
  State<MyTasksView> createState() => _MyTasksViewState();
}

class _MyTasksViewState extends State<MyTasksView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TasksCubit>(context).fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
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
              child: BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  final tasks = BlocProvider.of<TasksCubit>(context).tasks ?? [];
                  return tasks.isEmpty
                      ? const Center(child: EmptyTasksWidget())
                      : const TasksListViewWidget();
                },
              ),
            ),
            const TaskTextFieldWidget(),
          ],
        ),
      ),
    );
  }
}
