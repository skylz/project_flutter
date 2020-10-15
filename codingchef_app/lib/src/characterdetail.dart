//import 'package:universal_html/html.dart';
import 'package:flutter/material.dart';
import 'kindsappbar.dart';
//import 'package:universal_html/html.dart';

class CharacterDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('이지수'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.assignment_ind, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AppDesign())
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pic1.jpeg'),
                radius: 60.0,
              ),
            ),
            Divider(
              height: 60.0,
              color: Colors.grey[850],
              thickness: 0.5,
              endIndent: 30.0,
            ),
            Text('NAME',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w800,
                fontSize: 20.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('이지수',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text('이지수의 근력 레벨',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w800,
                  fontSize: 20.0
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text('14',
              style: TextStyle(
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('비트컴퓨터',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0
                ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('엠씨넥스',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: <Widget>[
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('하나제약',
                  style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.0
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pic2.jpeg'),
                radius: 40.0,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      )
    );
  }
}

