import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;

  final void Function(bool?) checkboxChange;
  final void Function() taskDelete;
  TaskList(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxChange,
      required this.taskDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.teal[400],
        value: isChecked,
        onChanged: checkboxChange,
      ),
      onLongPress: taskDelete,
    );
  }
}
