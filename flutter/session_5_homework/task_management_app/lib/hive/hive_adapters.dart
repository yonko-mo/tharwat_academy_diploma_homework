import 'package:hive_ce/hive.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';

part 'hive_adapters.g.dart';


@GenerateAdapters([AdapterSpec<TaskModel>()])
// ignore: unused_element
void _() {}
