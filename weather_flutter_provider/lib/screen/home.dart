import 'package:flutter/material.dart';
import 'package:weather_scraping/screen/searchLocationScreen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('안녕 날씨?', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            color: Colors.black54,
            iconSize: 30.0,
            padding: EdgeInsets.symmetric(horizontal: 20),
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.pushNamed(context, SearchLoactionScreen.id);
            },
          )
        ],
      ),
    );
  }
}
