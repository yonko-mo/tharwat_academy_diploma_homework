import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:task_management_app/core/bloc/simple_bloc_observer.dart';
import 'package:task_management_app/core/constants/app_constants.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/tasks/tasks_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/ui/my_tasks_view.dart';
import 'package:task_management_app/hive/hive_registrar.g.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapters();
  await Hive.openBox<TaskModel>(kTasksBox);
  runApp(const MyTasksApp());
}

class MyTasksApp extends StatelessWidget {
  const MyTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit()..fetchAllTasks(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyTasksView(),
      ),
    );
  }
}
