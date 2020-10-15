// expanded를 활용하여 객체들의 사이즈를 조절할 수 있음

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class ScreenC extends StatefulWidget {
  @override
  _ScreenCState createState() => _ScreenCState();
}

class _ScreenCState extends State<ScreenC> {
  int _score1 = 1;
  int _score2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Play Dice Game',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'image/dice$_score1.png',
                        width: 100,
                        height: 100,
                      ),
                      onTap: diceOneRefresh,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      '$_score1',
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                    )
                  ],
                ),
                SizedBox(
                  width: 40.0,
                ),
                Column(
                  children: [
                    FlatButton(
                      padding: EdgeInsets.all(0.0),
                      child: Image.asset(
                        'image/dice$_score2.png',
                        width: 100,
                        height: 100,
                      ),
                      onPressed: diceTwoRefresh,
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      '$_score2',
                      style: TextStyle(color: Colors.black, fontSize: 24.0),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 200.0,
              child: ButtonTheme(
                minWidth: 300,
                child: RaisedButton(
                  onPressed: diceRefresh,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'All Throwing',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Text(
                '각각의 주사위를 던지려면 던지고자하는 주사위를 클릭해주세요.',
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: 'SourceSansPro',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void diceRefresh() {
    setState(() {
      _score1 = Random().nextInt(6) + 1;
      _score2 = Random().nextInt(6) + 1;
    });
    int _score3 = _score1.toInt() + _score2.toInt();
    showToast('두 주사위의 합은 $_score3입니다.');
  }

  void diceTwoRefresh() {
    setState(() {
      _score2 = Random().nextInt(6) + 1;
    });
    int _score3 = _score1.toInt() + _score2.toInt();
    showToast('두 주사위의 합은 $_score3입니다.');
  }

  void diceOneRefresh() {
    setState(() {
      _score1 = Random().nextInt(6) + 1;
    });
    int _score3 = _score1.toInt() + _score2.toInt();
    showToast('두 주사위의 합은 $_score3입니다.');
  }
}

void showToast(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.redAccent,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
