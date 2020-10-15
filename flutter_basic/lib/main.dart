import 'package:flutter/material.dart';
import 'package:flutterbasic/cupertino_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter basic',
      theme: ThemeData(primarySwatch: Colors.blue),
//      home: CupertinoPage(),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  String _sample = '+를 누르면 1이 증가함';
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: Text(
          'Flutter basic',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_sample'),
            SizedBox(
              height: 10.0,
            ),
            Text('$_counter'),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              color: Colors.redAccent,
              child: Text(
                '화면이동',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CupertinoPage())
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
        onPressed: _changeText,
      ),
    );
  }

  void _changeText() {
    setState(() {
      _counter++;
      _sample = '계산중';
    });
  }
}
