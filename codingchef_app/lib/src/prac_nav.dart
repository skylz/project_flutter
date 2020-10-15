import 'package:flutter/material.dart';
//import 'package:universal_html/html.dart';

// Scaffold를 구성하는 하나하나가 Route
// _값은 사용하지 않는다는 의미

class ScreenA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('First page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                color: Colors.red,
                child: Text('Go to ScreenB'),
                onPressed: () {
                  Navigator.pushNamed(context, 'b');
                }),
            RaisedButton(
                color: Colors.red,
                child: Text('Go to ScreenC'),
                onPressed: () {
                  Navigator.pushNamed(context, 'c');
                }),
          ],
        ),
      ),
    );
  }
}

