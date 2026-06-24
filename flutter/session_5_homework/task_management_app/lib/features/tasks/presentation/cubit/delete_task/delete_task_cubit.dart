import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'delete_task_state.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit() : super(DeleteTaskInitial());

  Future<void> deleteTask(TaskModel task) async {
    try {
      await task.delete();
      emit(DeleteTaskSuccess());
    } catch (e) {
      emit(DeleteTaskFailure(e.toString()));
    }
  }
}
