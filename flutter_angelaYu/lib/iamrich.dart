import 'dart:math';
import 'package:flutter/material.dart';

class IamRich extends StatefulWidget {
  @override
  _IamRichState createState() => _IamRichState();
}

class _IamRichState extends State<IamRich> {
  int _coal = 0;
  int _diamond = 0;
  int _gold = 0;
  int _opal = 0;
  int _ruby = 0;
  int _silver = 0;

  String _jewelry = 'ruby';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Let's go Mining",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'Coal : ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$_coal',
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'diamond : ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$_diamond',
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'gold : ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$_gold',
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'opal : ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$_opal',
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'ruby : ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$_ruby',
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        child: Text(
                          'silver : ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          '$_silver',
                          style: TextStyle(fontSize: 24.0, color: Colors.blue),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Image.asset(
              'image/$_jewelry.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: 150.0,
              child: ButtonTheme(
                minWidth: 250,
                child: RaisedButton(
                  onPressed: JewelryMining,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.redAccent),
                  ),
                  color: Colors.white,
                  child: Row(
                    children: [
                      Icon(
                        Icons.refresh,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Mining',
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void JewelryMining() {
    List<String> jewelry = ['coal', 'diamond', 'gold', 'opal', 'ruby', 'silver'];
    int _index = Random().nextInt(jewelry.length);

    setState(() {
      _jewelry = jewelry[_index];
    });

    if (_jewelry == 'coal'){
      _coal ++;
    }else if(_jewelry == 'diamond'){
      _diamond ++;
    }else if(_jewelry == 'gold'){
      _gold ++;
    }else if(_jewelry == 'opal'){
      _opal ++;
    }else if(_jewelry == 'ruby'){
      _ruby ++;
    }else{
      _silver ++;
    }
  }
}
