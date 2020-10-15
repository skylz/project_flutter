import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

// provider를 사용하면 더이상 StatefulWidget을 사용할 필요가 없음

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) =>
                  AddTaskScreen(addTaskScreenCallback: (newTaskTitle) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                  }));
        },
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding:
              EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.list,
                  size: 30.0,
                  color: Colors.lightBlueAccent,
                ),
                backgroundColor: Colors.white,
                radius: 30.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Todoey',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                '${Provider.of<TaskData>(context).taskCount().toString()} length',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
            ],
          ),
        ),
        Expanded(
            child: Container(
                padding: EdgeInsets.only(left: 20.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: TasksList()))
      ]),
    );
  }
}
