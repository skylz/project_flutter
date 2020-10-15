import 'package:flutter/material.dart';
import 'package:weather_scraping/services/getTodayWeather.dart';
import 'package:weather_scraping/services/getTomorrowWeather.dart';
import 'package:weather_scraping/services/getWeekWeather.dart';
import 'package:weather_scraping/services/loadJson.dart';

class WeatherScreen extends StatefulWidget {
  final String selectedLocation;

  WeatherScreen({Key key, this.selectedLocation}) : super(key: key);

  // Data List
  List<List<String>> locationWeatherNowData;
  List<List<String>> locationWeatherWeekData;
  List<List<String>> locationWeatherInfo;

  static const String id = 'weatherScreen';

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  void loadData() async {
    Map<String, dynamic> locationMap = await parseJson();
    String locationCode = locationMap['${widget.selectedLocation}'].toString();
    widget.locationWeatherNowData =
        await getNowWeather(locationCode: locationCode);
    widget.locationWeatherWeekData =
        await getWeekWeather(locationCode: locationCode);
    widget.locationWeatherInfo =
        await getTomorrowWeather(locationCode: locationCode);
    print(widget.locationWeatherNowData);
    print(widget.locationWeatherWeekData);
    print(widget.locationWeatherInfo);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
    // TestScreen(
    //     selectedLocation: widget.selectedLocation,
    //     selectedLocationInfo: widget.locationWeatherNowData[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedLocation),
      ),
      body: ListView(),
    );
  }
}
