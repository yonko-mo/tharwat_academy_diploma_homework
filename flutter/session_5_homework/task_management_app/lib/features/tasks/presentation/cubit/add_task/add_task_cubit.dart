import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/tasks_repo.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  final TasksRepo tasksRepo = TasksRepo();

  Future<void> addTask(TaskModel task) async {
    emit(AddTaskLoading());
    try {
      await tasksRepo.addTask(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailure(e.toString()));
    }
  }
}
