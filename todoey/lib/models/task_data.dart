import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData with ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  int taskCount() {
    return _tasks.length;
  }

  void addTask(String newTask) {
    _tasks.add(Task(name: newTask));
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }
}
