import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:task_management_app/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskTextFieldWidget extends StatefulWidget {
  const TaskTextFieldWidget({super.key});

  @override
  State<TaskTextFieldWidget> createState() => _TaskTextFieldWidgetState();
}

class _TaskTextFieldWidgetState extends State<TaskTextFieldWidget> {
  String title = '';
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          BlocProvider.of<TasksCubit>(context).fetchAllTasks();
          controller.clear();
          title = '';
        }
        if (state is AddTaskFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Colors.black.withValues(alpha: 0.06),
                offset: const Offset(0, -2),
              ),
              const BoxShadow(color: Colors.white, offset: Offset(0, 0)),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    title = value;
                  },
                  onSubmitted: state is AddTaskLoading
                      ? null
                      : (value) {
                          if (title.trim().isEmpty) return;
                          var currentDate = DateTime.now();
                          var formattedCurrentDate = DateFormat(
                            'dd-MMM-yyyy',
                          ).format(currentDate);
                          final task = TaskModel(
                            title: title,
                            date: formattedCurrentDate,
                          );
                          BlocProvider.of<AddTaskCubit>(context).addTask(task);
                        },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 18),
                    filled: true,
                    fillColor: Color(0xffedf3f1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Add a new task...',
                    hintStyle: TextStyle(
                      color: Color(0xff434947),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xffdde3e1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: state is AddTaskLoading
                    ? null
                    : () {
                        if (title.trim().isEmpty) return;
                        var currentDate = DateTime.now();
                        var formattedCurrentDate = DateFormat(
                          'dd-MMM-yyyy',
                        ).format(currentDate);
                        final task = TaskModel(title: title, date: formattedCurrentDate);
                        BlocProvider.of<AddTaskCubit>(context).addTask(task);
                      },
                icon: state is AddTaskLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xff919795),
                        ),
                      )
                    : const Icon(Icons.add, color: Color(0xff919795), size: 28),
              ),
            ],
          ),
        );
      },
    );
  }
}
