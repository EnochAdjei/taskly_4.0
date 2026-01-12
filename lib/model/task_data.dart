import 'package:flutter/material.dart';
import 'package:taskly4_0/model/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: "Buy food"),
    Task(title: "Cook food"),
    Task(title: "Eat food"),
    Task(title: "Wash food"),
  ];

  void addNewTask(String newTaskTile) {
    final newTask = Task(title: newTaskTile);
    tasks.add(newTask);
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
