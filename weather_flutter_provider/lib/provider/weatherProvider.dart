import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_scraping/services/loadJson.dart';
import '../model/weatherModel.dart';
import '../services/getNowWeater.dart';

class WeatherProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _locationName;
  int _locationCode;
  List<String> _locationList;
  List<dynamic> _locationCodeList;
  List<WeatherInfo> _todayweather;

  String get locationName => _locationName;
  int get locationCode => _locationCode;

  List<String> getLocationList() {
    return _locationList;
  }

  List<dynamic> getLocationCodeList() {
    return _locationCodeList;
  }

  List<WeatherInfo> getTodayWeather() {
    return _todayweather;
  }

  void getNameCode(int index) {
    _locationName = _locationList[index];
    _locationCode = _locationCodeList[index];
  }

  // 각각의 list안에 필요한 정보를 넣는 과정
  Future<void> getLoadLocationData() async {
    Map<String, dynamic> weatherLocation = await parseJson();
    _locationList = weatherLocation.keys.toList();
    _locationCodeList = weatherLocation.values.toList();
  }

  final _weatherhelper = WeatherApi();
  final _streamController = StreamController<List<WeatherInfo>>();

  Future<void> getWeatherInfo() async {
    final weatherResult =
        await _weatherhelper.getNowWeather(locationCode: _locationCode);
    _streamController.add(weatherResult);
    notifyListeners();
  }

  // 결과적으로 weatherStream에 최종 날씨 정보가 들어가 있음.
  Stream<List<WeatherInfo>> get weatherStreamController {
    return _streamController.stream;
  }
}
