import 'package:codingchefapp/src/notbuilder.dart';
import 'package:flutter/material.dart';
//import 'package:universal_html/html.dart';
//import 'package:universal_html/html.dart';

class AppDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('이동일'),
          backgroundColor: Colors.deepOrange,
          centerTitle: true,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.assignment_ind, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MyPage())
                );
              },
            )
          ],
        ),
        body: Builder(
          builder: (BuildContext ctx) {
            return Center(
              child: FlatButton(
                child: Text(
                  'Show me',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: () {
                  Scaffold.of(ctx).showSnackBar(SnackBar(
                    content: Text('hellow'),
                  ));
                },
              ),
            );
          },
        ));
  }
}
