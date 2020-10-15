import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String content;
  final bool isChecked;
  final Function checkboxCallback;

  TaskTile({this.content, this.isChecked, this.checkboxCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          content,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            activeColor: Colors.lightBlueAccent,
            value: isChecked,
            onChanged: checkboxCallback));
  }
}
