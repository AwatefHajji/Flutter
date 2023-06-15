import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallback;
  AddTaskScreen(this.addTaskCallback);
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(children: [
        const Text(
          "Add Task",
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        TextField(
          autofocus: true,
          textAlign: TextAlign.center,
          onChanged: (newText) {
            newTaskTitle = newText;
          },
        ),
        TextButton(
            onPressed: () {
              Provider.of<TaskData>(context, listen: false)
                  .addTask(newTaskTitle!);
              Navigator.pop(context);
            },
            child: const Text("Save Task"),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.teal))
      ]),
    );
  }
}
