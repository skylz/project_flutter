import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_scraping/constant.dart';
import 'package:weather_scraping/screen/component/body.dart';
import 'package:weather_scraping/screen/searchLocationScreen.dart';

class HomeScreen extends StatelessWidget {
  static String id = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: BuildAppbar(
            search: () => Navigator.pushNamed(context, SearchWeatherScreen.id)),
        body: Body(),
      ),
    );
  }
}

class BuildAppbar extends AppBar {
  BuildAppbar({Key key, Function search})
      : super(
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: Text(
              '안녕 날씨?',
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              IconButton(
                color: Colors.black54,
                iconSize: 30.0,
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                icon: Icon(Icons.search),
                onPressed: () {
                  search();
                },
              )
            ]);
}
