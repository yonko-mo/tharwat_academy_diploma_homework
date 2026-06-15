import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_management_app/constants.dart';
import 'package:task_management_app/models/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  List<TaskModel>? tasks;

  void fetchAllTasks() {
    var tasksBox = Hive.box<TaskModel>(kTasksBox);
    tasks = tasksBox.values.toList();
    emit(TasksSuccess());
  }
}
