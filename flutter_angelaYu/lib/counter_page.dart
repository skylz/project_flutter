// Flationg Acttion Button이 여러개 있을 때 hero 문제가 생길 수 있다.
// 따라서 FloatingButton에 서로 다른 heroTag를 지정해주면 해당 문제가 해결될 수 있다.

import 'package:flutter/material.dart';

class ScreenB extends StatefulWidget {
  @override
  _ScreenBState createState() => _ScreenBState();
}

class _ScreenBState extends State<ScreenB> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Press The Button',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              '$_counter',
              style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   FloatingActionButton(
                     heroTag: "addButton",
                     backgroundColor: Colors.redAccent,
                     child: Icon(Icons.add),
                     onPressed: _increment,
                   ),
                   SizedBox(
                     width: 30.0,
                   ),
                   FloatingActionButton(
                     heroTag: "removeButton",
                     backgroundColor: Colors.redAccent,
                     child: Icon(Icons.remove),
                     onPressed: _decrement,
                   )
                 ],
               ),
               SizedBox(
                 height: 30.0,
               ),
               ButtonTheme(
                 minWidth: 150,
                 child: RaisedButton(
                   child: Text('Back to the Main Page',
                   style: TextStyle(
                     color: Colors.white,
                     fontSize: 16.0
                   ),),
                   color: Colors.redAccent,
                   onPressed: () {
                     Navigator.pop(context);
                   },
                 ),
               )
             ],
            )
          ],
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _counter ++;
    });
  }

  void _decrement() {
    setState(() {
      _counter --;
    });
  }
}
