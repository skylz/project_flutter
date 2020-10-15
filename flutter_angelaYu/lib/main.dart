// multipage route를 사용할 때에는 반드시 home 대신에 initialRoute 기능을 사용한다.

import 'package:flutter/material.dart';
import 'package:test2app/BMI/bmi_result.dart';
import 'package:test2app/BMI/input_page.dart';
import 'package:test2app/Xylophone_page.dart';
import 'package:test2app/askme.dart';
import 'package:test2app/counter_page.dart';
import 'package:test2app/destiny/destiny_main.dart';
import 'package:test2app/dice_page.dart';
import 'package:test2app/main_page.dart';
import 'package:test2app/login_page.dart';
import 'package:test2app/iamrich.dart';
import 'package:test2app/miCard.dart';
import 'package:test2app/quizer/quizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        //put some option to customize Them instance
      ),
      debugShowCheckedModeBanner: false,
      title: 'testing app',
      initialRoute: '/',
      routes: {
        '/' : (context) => Login(),
        '/a' : (context) => ScreenA(),
        '/b' : (context) => ScreenB(),
        '/c' : (context) => ScreenC(),
        '/rich' : (context) => IamRich(),
        '/layout' : (context) => MiCard(),
        '/askme' : (context) => AskMe(),
        '/Xylophone' : (context) => Xylophone(),
        '/quiz' : (context) => Quizzler(),
        '/destiny' : (context) => Destiny(),
        '/bmi' : (context) => InputPage(),
        '/bmiResult' : (context) => BmiResult(),
      },
    );
  }
}