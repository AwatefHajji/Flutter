import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_data.dart';
import 'package:provider/provider.dart';
import 'task_list.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            itemCount: taskData.tasks.length,
            itemBuilder: (context, index) {
              return TaskList(
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkboxChange: (newValue) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                taskDelete: () {
                  taskData.removeTask(taskData.tasks[index]);
                },
              );
            });
      },
    );
  }
}
