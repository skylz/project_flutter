import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:todoey_flutter/models/task.dart';

// StatefulWidget -> StatelessWidget
// widget -> provider 객체

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return TaskTile(
              content: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallback: (isChecked) {
                Provider.of<TaskData>(context, listen: false).toggleTask(index);
              });
        },
        itemCount: taskData.tasks.length,
      );
    });
  }
}
