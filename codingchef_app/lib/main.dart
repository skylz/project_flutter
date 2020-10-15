import 'dart:io';

import 'package:codingchefapp/src/ScreenB.dart';
import 'package:codingchefapp/src/ScreenC.dart';
import 'package:codingchefapp/src/prac_nav.dart';
import 'package:flutter/material.dart';
//import 'package:universal_html/html.dart';
import 'src/characterdetail.dart';

// 뒤에 ()가 붙어 있으면 일반적으로 함수이다.
// main은 앱의 시작점
// runApp의 괄호 안에는 위젯이 들어와야 한다.

// 함수와 클래스
// 함수는 보통 소문자로 시작함.
// 클래스는 보통 대문자로 시작함.

void main() => runApp(MyApp());

// MyApp은 정적인 위젯
// MaterialApp으로 return해야 플러터 위젯 사용할 수 있음.
// 실질적으로 MaterialApp이 모든 위젯을 감싸고 있음.
// primarySwatch : 앱에서 사용할 기본적인 색상 견본
// home: MyHomePage() : 커스텀 위젯. 앱을 실행시키면 MyApp위젯 내에서 제일 먼저 보는 것. 반드시 필요

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Character Card',
      home: MyCard(),
      initialRoute: '/',
      routes: {
        'a': (context) => ScreenA(),
        'b': (context) => ScreenB(),
        'c': (context) => ScreenC()
      },
    );
  }
}

// Scaffold는 앱 내의 도화지같은 존재. 여기다가 다양한 위젯을 그릴 수 있다.
// 위젯 내에서 글씨를 쓰기위해서는 Text위젯이 필요함
// Column 위젯은 위젯 내 모든 위젯들을 세로로 배치한다.
// children: <Widget>[], 여기서 []은 배열을 의미하고 세로로 배치할 위젯들을 배열 속에 나열해주면 된다.

class MyCard extends StatefulWidget {
  @override
  _MyCardState createState() => _MyCardState();
}

// Column 위젯은 세로축 길이에 대해서는 상관하지 않고 오로지 컨텐츠들을 가로길이에 한해서 중앙으로 배열한다.
// 그렇기에 mainAxisAlignment를 사용해서 세로길이에 대해 중앙으로 배열해줌으로써 컨텐츠를 앱 화면 정중앙에 배치시킬 수 있다.
// build함수는 Scaffold를 리턴하는데, 여기서 BuildContext는 위젯트리의 위치를 알려주는 용도이다.

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('어떤 몬스터가 있을까?'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.assignment_ind),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CharacterDetail())
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              child: UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/pic1.jpeg'),
                  radius: 60.0,
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/pic2.jpeg'),
                    backgroundColor: Colors.white,
                  )
                ],
                accountName: Text('이지수'),
                accountEmail: Text('leejisu@gmail.com'),
                onDetailsPressed:(){
                },
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                  )
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.grey[800],),
              title: Text('Home',
              textScaleFactor: 1.5,),
              onTap: () {
              },
              trailing: Icon(Icons.add,
              color: Colors.grey[800],),
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[800],),
              title: Text('Setting',
                textScaleFactor: 1.5,),
              onTap: () {
              },
              trailing: Icon(Icons.add,
                color: Colors.grey[800],),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[800],),
              title: Text('Q&A',
                textScaleFactor: 1.5,),
              onTap: () {
              },
              trailing: Icon(Icons.add,
                color: Colors.grey[800],),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('몬스터가 있습니다.', textScaleFactor: 1.5,),
              Text('보고싶나요?', textScaleFactor: 1.5,),
              Text('그럼 위의 List 버튼을 눌러주세요', textScaleFactor: 1.5,),
            ],
          ),
        ),
      ),
    );
  }
}






