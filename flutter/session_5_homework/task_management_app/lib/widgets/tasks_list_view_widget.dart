import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/widgets/task_widget.dart';

class TasksListViewWidget extends StatelessWidget {
  const TasksListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        List<TaskModel> tasks = BlocProvider.of<TasksCubit>(context).tasks ?? [];
        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              task: tasks[index],
            );
          },
        );
      },
    );
  }
}
