import 'package:hive/hive.dart';
import 'package:task_management_app/core/constants/app_constants.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

class TasksRepo {
  List<TaskModel> fetchAllTasks() {
    return Hive.box<TaskModel>(kTasksBox).values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    var tasksBox = Hive.box<TaskModel>(kTasksBox);
    await tasksBox.add(task);
  }

  Future<void> deleteTask(TaskModel task) async {
    await task.delete();
  }

  Future<void> toggleTaskCompletion(TaskModel task) async {
    task.toggleCompletion();
    await task.save();
  }
}
