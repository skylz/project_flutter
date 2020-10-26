import 'dart:convert';

import 'package:flutter/material.dart';
import './user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: JsonTest(),
    );
  }
}

class JsonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // json 형식 생성
    String json =
        '{"name" : "minki", "email" : "minki@naver.com", "created_Time" : 123123, "address" : {"street" : "장한로91", "city" : "Korea"}}';

    // jsondecode를 통해 json을 map형식으로 변경
    Map<String, dynamic> userMap = jsonDecode(json);

    // user를 객체로 변환시켜 json을 할당할 것이기 때문에 다음과 같이 코드를 입력해야 한다.
    User user = User.fromJson(userMap);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.name),
            Text(user.email),
            Text('${user.createdTime}'),
            Text('${user.address.city}'),
            Text('${user.address.street}'),
          ],
        ),
      ),
    );
  }
}
