import 'package:flutter/material.dart';
import './services/getNews.dart';

class HomeNewsScreen extends StatefulWidget {
  @override
  _HomeNewsScreenState createState() => _HomeNewsScreenState();
}

class _HomeNewsScreenState extends State<HomeNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            GetNews().getNews();
          },
        ),
      ),
    );
  }
}
