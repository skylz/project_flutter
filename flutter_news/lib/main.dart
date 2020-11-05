import 'package:flutter_news/homeNewsScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeNewsScreen(),
      getPages: [GetPage(name: 'newsHome', page: () => HomeNewsScreen())],
    );
  }
}
