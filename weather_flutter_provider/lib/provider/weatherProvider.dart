import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../model/weatherModel.dart';
import '../services/getTodayWeater.dart';

class WeatherProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String _locationName;
  int _locationCode;

  String get locationName => _locationName;
  int get locatonCode => _locationCode;

  final List<String> _locationList = [];
  final List<dynamic> _locationCodeList = [];
  final List<String> _filterLocationList = [];
  List<WeatherInfo> _todayweather = [];

  List<String> getLocationList() {
    return _locationList;
  }

  List<dynamic> getLocationCodeList() {
    return _locationCodeList;
  }

  List<String> getFilterLocationList() {
    return _filterLocationList;
  }

  List<WeatherInfo> getTodayWeather() {
    return _todayweather;
  }

  final _weatherhelper = WeatherApi();
  final _streamController = StreamController<List<WeatherInfo>>();

  // 결과적으로 weatherStream에 최종 날씨 정보가 들어가 있음.
  Stream<List<WeatherInfo>> get weatherStream {
    return _streamController.stream;
  }

  Future<void> getWeatherInfo() async {
    final weatherResult = await _weatherhelper.getNowWeather();
    _streamController.add(weatherResult);
    notifyListeners();
  }
}
