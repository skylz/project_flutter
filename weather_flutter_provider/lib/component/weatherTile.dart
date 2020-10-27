import 'package:flutter/material.dart';
import '../provider/weatherProvider.dart';
import 'package:weather_scraping/screen/weatherScreen.dart';
import '../screen/weatherScreen.dart';
import '../getIt.dart';

class WeatherTile extends StatelessWidget {
  // final String locationName;
  // final int locationCode;

  // WeatherTile({this.locationName, this.locationCode});

  @override
  Widget build(BuildContext context) {
    final provider = getIt.get<WeatherProvider>();
    return Card(
      child: ListTile(
        title: Text('${provider.locationName}'),
        onTap: () {
          Navigator.pushNamed(context, WeatherScreen.id);
        },
      ),
    );
  }
}
