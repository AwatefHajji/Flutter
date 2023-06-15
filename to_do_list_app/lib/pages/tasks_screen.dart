import 'package:flutter/material.dart';
import 'package:to_do_list_app/models/task_data.dart';
import 'package:to_do_list_app/pages/add_task_screen.dart';
import '../widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: AddTaskScreen((newTaskTitle) {}))));
        },
        backgroundColor: Colors.teal[400],
        child: Icon(Icons.add, size: 24),
      ),
      backgroundColor: Colors.teal[400],
      body: Container(
        padding:
            const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 80),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
            children: [
              Icon(Icons.playlist_add_check, size: 40, color: Colors.white),
              SizedBox(
                height: 40,
              ),
              Text(
                "To DO List",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
          Text("${Provider.of<TaskData>(context).tasks.length} tasks",
              style: TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: TasksList(),
            ),
          )
        ]),
      ),
    );
  }
}
