import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTasksTitle;

    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0))),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 30.0, right: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  'Add Task',
                  style:
                      TextStyle(color: Colors.lightBlueAccent, fontSize: 30.0),
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  newTasksTitle = newText;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  color: Colors.lightBlueAccent,
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTasksTitle);
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
