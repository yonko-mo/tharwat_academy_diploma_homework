import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_management_app/core/theme/app_colors.dart';
import 'package:task_management_app/core/theme/app_styles.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/add_task/add_task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/tasks/tasks_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/ui/widgets/no_tasks_widget.dart';
import 'package:task_management_app/features/tasks/presentation/ui/widgets/add_task_text_field.dart';
import 'package:task_management_app/features/tasks/presentation/ui/widgets/tasks_list_view_widget.dart';

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
          backgroundColor: AppColors.appBarBackground,
          title: const Text('My Tasks', style: AppStyles.appBarTitle),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<TasksCubit, TasksState>(
                builder: (context, state) {
                  if (state is TasksSuccess && state.tasks.isNotEmpty) {
                    return TasksListViewWidget(tasks: state.tasks);
                  }
                  return const Center(child: NoTasksWidget());
                },
              ),
            ),
            const AddTaskTextField(),
          ],
        ),
      ),
    );
  }
}
