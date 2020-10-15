// 체크박스처럼 색깔을 누르면 검정색으로 다시 누르면 원래 색으로 돌아오는 기능 나중에 꼭 구현하기

import 'package:flutter/material.dart';

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  @override
  Widget build(BuildContext context) {
    GlobalKey stickyKey = GlobalKey();
    // screen size의 크기를 알 수 있는 명령
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        key: stickyKey,
        backgroundColor: Colors.redAccent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Xylophone',
          style: TextStyle(fontSize: 20.0, fontFamily: 'Pacifico'),
        ),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red),
            buildKey(color: Colors.deepOrange),
            buildKey(color: Colors.yellow),
            buildKey(color: Colors.green),
            buildKey(color: Colors.blue),
            buildKey(color: Colors.indigo),
            buildKey(color: Colors.purple),
          ],
        ),
      ),
    );
  }

  Expanded buildKey({Color color}) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
        },
      ),
    );
  }

//  Widget buildKey(int r, int g, int b, double o) {
//    return Expanded(
//      child: FlatButton(
//        color: Color.fromRGBO(r, g, b, o),
//        onPressed: () => PlaySound(1),
//      ),
//    );
//  }

  Widget ChangeColor(Color color){
    setState(() {
      return color;
    });
  }
}