import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_ce/hive.dart';
import 'package:task_management_app/core/constants/app_constants.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  void fetchAllTasks() {
    var tasksBox = Hive.box<TaskModel>(kTasksBox);
    final tasks = tasksBox.values.toList();
    emit(TasksSuccess(tasks));
  }
}
