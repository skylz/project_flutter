import 'package:flutter/material.dart';
import 'package:test2app/counter_page.dart';
import 'package:test2app/dice_page.dart';

class ScreenA extends StatelessWidget {
  BuildContext get context => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'Main Page',
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Go to the one&one counter',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/b');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Go to the Dice Game',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/c');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Become Rich',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/rich');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'MiCard',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/layout');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Ask Me Something',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/askme');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Xylophone',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Xylophone');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Quizzler',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/quiz');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'Destiny',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/destiny');
                  }),
            ),
            ButtonTheme(
              minWidth: 250.0,
              child: RaisedButton(
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.redAccent)),
                  color: Colors.white,
                  child: Text(
                    'BMI Calculator',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/bmi');
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
