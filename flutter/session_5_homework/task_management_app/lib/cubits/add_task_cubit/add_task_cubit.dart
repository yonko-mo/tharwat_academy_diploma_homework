import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_management_app/constants.dart';
import 'package:task_management_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  Future<void> addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      var tasksBox = Hive.box<TaskModel>(kTasksBox);
      await tasksBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
