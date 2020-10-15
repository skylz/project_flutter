import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TaskData with ChangeNotifier, DiagnosticableTreeMixin {
  // make private tasks data
  List<Task> _tasks = [];

  // 이렇게 데이터를 불러오면 외부에서 데이터를 다이렉트로 수정할 수 있게된다.
  // List<Task> get tasks => _tasks;

  // UnmodifiableListView를 사용하면 function으로 접근해야 데이터를 수정할 수 있게 되어
  // 데이터를 안전하게 보호할 수 있다.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get tasksCount => _tasks.length;

  void addTask(String newTaskData) {
    final task = Task(name: newTaskData);
    _tasks.add(task);
    notifyListeners();
  }

  void togleTask(int index) {
    _tasks[index].toggleDone();
    notifyListeners();
  }

  void delteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}
