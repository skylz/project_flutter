import 'package:flutter/material.dart';

class TodayWeather {
  final String time;
  final String temp;
  final String feelTemp;
  final String humid;
  final String windDirction;
  final String windSpeed;
  final String rainfall;

  TodayWeather(
      {this.time,
      this.temp,
      this.feelTemp,
      this.humid,
      this.windDirction,
      this.windSpeed,
      this.rainfall});
}
