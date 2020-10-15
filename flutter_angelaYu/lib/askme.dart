import 'package:flutter/material.dart';
import 'dart:math';

class AskMe extends StatefulWidget {
  @override
  _AskMeState createState() => _AskMeState();
}

class _AskMeState extends State<AskMe> {
  int _index = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 0.0,
          title: Text(
            'Ask Me Something',
            style: TextStyle(
                color: Colors.white, fontSize: 20.0, fontFamily: 'Pacifico'),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: GestureDetector(
              child: Image.asset('image/ask/ball$_index.png'),
            onTap: askMe,
          ),
        ));
  }

  void askMe() {
    setState(() {
      _index = Random().nextInt(5) + 1;
    });
  }
}
