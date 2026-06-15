import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/models/task_management.dart';
import 'package:task_management_app/models/task_model.dart';

class TaskTextFieldWidget extends StatefulWidget {
  final TaskManagement taskManagement;
  final void Function() updateTasks;

  const TaskTextFieldWidget({
    super.key,
    required this.taskManagement,
    required this.updateTasks,
  });

  @override
  State<TaskTextFieldWidget> createState() => _TaskTextFieldWidgetState();
}

class _TaskTextFieldWidgetState extends State<TaskTextFieldWidget> {
  late String title;
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            onPressed: () {
              var currentDate = DateTime.now();
              var formattedCurrentDate = DateFormat(
                'dd-MMM-yyyy',
              ).format(currentDate);
              final task = TaskModel(title: title, date: formattedCurrentDate);
              widget.taskManagement.addTask(task);
              widget.updateTasks();
              controller.clear();
            },
            icon: const Icon(Icons.add, color: Color(0xff919795), size: 28),
          ),
        ],
      ),
    );
  }
}
