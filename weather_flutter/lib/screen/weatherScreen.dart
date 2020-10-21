import 'package:flutter/material.dart';
import '../services/getTodayWeather.dart';
import '../model/weatherModel.dart';
import 'dart:async';

class WeatherScreen extends StatefulWidget {
  static const String id = 'weatherScreen';
  final String locationName;
  final int locationCode;

  WeatherScreen({this.locationName, this.locationCode});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  List<WeatherInfo> todayweather;
  StreamController<List<WeatherInfo>> streamController = StreamController();

  @override
  void initState() {
    setState(() {
      getget();
    });
    super.initState();
  }

  void getget() async {
    todayweather = await getNowWeather(locationCode: widget.locationCode);
    streamController.add(todayweather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.locationName),
      ),
      body: Center(
        child: StreamBuilder<Object>(
            stream: streamController.stream,
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text('날씨를 불러오고 있습니다.'),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('지역 코드 : ${widget.locationCode}'),
                    Text('time : ${snapshot.data[0].time}'),
                    Text('temp : ${snapshot.data[0].temp}'),
                    Text('feelTemp : ${snapshot.data[0].feelTemp}'),
                    Text('humid : ${snapshot.data[0].humid}'),
                    Text('windDirection : ${snapshot.data[0].windDirection}'),
                    Text('windSpeed : ${snapshot.data[0].windSpeed}'),
                    Text('rainFall : ${snapshot.data[0].rainfall}')
                  ],
                );
              }
            }),
      ),
    );
  }
}
