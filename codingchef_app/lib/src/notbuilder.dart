import 'package:codingchefapp/src/toast.dart';
import 'package:flutter/material.dart';

//import 'package:universal_html/html.dart';
//import 'package:universal_html/html.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('build없이 SnackBar 구현하'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.assignment_ind, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => MyToast())
              );
            },
          )
        ],
      ),
      body: MySnackbar(),
    );
  }
}

class MySnackbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          child: Text('Show me'),
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Hellow',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.teal,
                duration: Duration(milliseconds: 1000),
              ),
            );
          }),
    );
  }
}
