import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/data/repos/tasks_repo.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepo tasksRepo;

  TasksCubit(this.tasksRepo) : super(TasksInitial());

  void fetchAllTasks() {
    final tasks = tasksRepo.fetchAllTasks();
    emit(TasksSuccess(tasks));
  }

  Future<void> toggleTaskCompletion(TaskModel task) async {
    await tasksRepo.toggleTaskCompletion(task);
    fetchAllTasks();
  }

  Future<void> deleteTask(TaskModel task) async {
    await tasksRepo.deleteTask(task);
    fetchAllTasks();
  }
}
