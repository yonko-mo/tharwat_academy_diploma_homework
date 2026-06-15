import 'package:task_management_app/models/task_model.dart';

class TaskManagement {
  final List<TaskModel> tasks = [];
  void addTask(TaskModel task) {
    tasks.add(task);
  }

  void removeTask(TaskModel task) {
    tasks.remove(task);
  }

  bool get isEmpty => tasks.isEmpty;

  int get tasksCount => tasks.length;
}
