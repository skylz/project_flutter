import 'package:flutter/material.dart';
import 'package:weather_scraping/screen/weatherScreen.dart';
import '../screen/weatherScreen.dart';

class WeatherTile extends StatelessWidget {
  final List<String> weatherList;
  final int index;
  final Map<String, dynamic> locationDictionary;

  WeatherTile({this.weatherList, this.index, this.locationDictionary});

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
                        locationCode: locationDictionary.values.toList()[index],
                      )));
        },
      ),
    );
  }
}
