import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_management_app/constants.dart';
import 'package:task_management_app/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:task_management_app/models/task_model.dart';
import 'package:task_management_app/simple_bloc_observer.dart';
import 'package:task_management_app/views/my_tasks_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTasksBox);
  runApp(const MyTasksApp());
}

class MyTasksApp extends StatelessWidget {
  const MyTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyTasksView(),
      ),
    );
  }
}
