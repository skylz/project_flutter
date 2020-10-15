import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function addTaskScreenCallback;

  AddTaskScreen({this.addTaskScreenCallback});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

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
                onChanged: (value) {
                  newTaskTitle = value;
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
                  addTaskScreenCallback(newTaskTitle);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
