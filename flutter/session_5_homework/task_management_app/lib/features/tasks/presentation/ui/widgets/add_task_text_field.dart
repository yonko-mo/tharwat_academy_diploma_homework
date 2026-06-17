import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/core/theme/app_colors.dart';
import 'package:task_management_app/core/theme/app_styles.dart';
import 'package:task_management_app/features/tasks/data/models/task_model.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/add_task/add_task_cubit.dart';
import 'package:task_management_app/features/tasks/presentation/cubit/tasks/tasks_cubit.dart';

class AddTaskTextField extends StatefulWidget {
  const AddTaskTextField({super.key});

  @override
  State<AddTaskTextField> createState() => _AddTaskTextFieldState();
}

class _AddTaskTextFieldState extends State<AddTaskTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submitTask() {
    if (_controller.text.trim().isEmpty) return;
    final formattedDate = DateFormat('dd-MMM-yyyy').format(DateTime.now());
    final task = TaskModel(title: _controller.text, date: formattedDate);
    BlocProvider.of<AddTaskCubit>(context).addTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccess) {
          BlocProvider.of<TasksCubit>(context).fetchAllTasks();
          _controller.clear();
        }
        if (state is AddTaskFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        final isLoading = state is AddTaskLoading;
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
                  controller: _controller,
                  onSubmitted: isLoading ? null : (_) => _submitTask(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 18),
                    filled: true,
                    fillColor: AppColors.inputFill,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Add a new task...',
                    hintStyle: AppStyles.inputHint,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.addButtonBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: isLoading ? null : _submitTask,
                icon: isLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.addButtonIcon,
                        ),
                      )
                    : const Icon(
                        Icons.add,
                        color: AppColors.addButtonIcon,
                        size: 28,
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
