import 'package:hive_ce/hive.dart';

class TaskModel extends HiveObject {
  final String title;
  final String date;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.date,
    this.isCompleted = false,
  });

  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TaskModel && other.title == title && other.date == date;
  }

  @override
  int get hashCode => title.hashCode ^ date.hashCode;
}
