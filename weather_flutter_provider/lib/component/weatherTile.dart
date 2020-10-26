import 'package:flutter/material.dart';
import 'package:weather_scraping/screen/weatherScreen.dart';
import '../screen/weatherScreen.dart';

class WeatherTile extends StatelessWidget {
  final List<String> weatherList;
  final int index;
  final List<dynamic> locationCodeList;

  WeatherTile({this.weatherList, this.index, this.locationCodeList});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${weatherList[index]}'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WeatherScreen(
                        locationName: weatherList[index],
                        locationCode: locationCodeList[index],
                      )));
        },
      ),
    );
  }
}
