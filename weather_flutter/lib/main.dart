import 'package:flutter/material.dart';
import 'package:weather_scraping/screen/home.dart';
import 'package:weather_scraping/screen/searchLocationScreen.dart';
import 'package:weather_scraping/screen/weatherScreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(Weather());

class Weather extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        SearchLoactionScreen.id: (context) => SearchLoactionScreen(),
        WeatherScreen.id: (context) => WeatherScreen(),
      },
    );
  }
}
