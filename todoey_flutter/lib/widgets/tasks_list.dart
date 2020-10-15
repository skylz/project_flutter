import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_tile.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskdata, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskdata.tasks[index].name,
              isChecked: taskdata.tasks[index].isDone,
              checkboxCallback: (checkboxState) {
                taskdata.togleTask(index);
              },
              longPressCallback: () {
                Task task = taskdata.tasks[index];
                taskdata.delteTask(task);
              },
            );
          },
          itemCount: taskdata.tasksCount,
        );
      },
    );
  }
}
