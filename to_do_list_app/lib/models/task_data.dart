import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_model.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(name: "learn Provider"),
    Task(name: "learn Block"),
    Task(name: "learn SQFLITE"),
  ];
  void addTask(String newTaskTitle) {
    tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
