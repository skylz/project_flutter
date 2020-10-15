import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallback;

  TaskTile(
      {this.taskTitle,
      this.isChecked,
      this.checkboxCallback,
      this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        longPressCallback();
      },
      child: ListTile(
          title: Text(
            taskTitle,
            style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
              activeColor: Colors.lightBlueAccent,
              value: isChecked,
              onChanged: checkboxCallback)),
    );
  }
}
