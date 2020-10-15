import 'package:codingchefapp/src/prac_container.dart';
import 'package:codingchefapp/src/prac_nav.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Toast 구현하기'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.assignment_ind, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ScreenA()
                  ));
              })
        ],
      ),
      body: Center(
        child: FlatButton(
            color: Colors.blue,
            onPressed: () {
              flutterToast();
            },
            child: Text('toast')),
      ),
    );
  }
}

// toast함수는 return값이 없으므로 void함수로 만드는 것
void flutterToast() {
  Fluttertoast.showToast(
      msg: 'Flutter',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
