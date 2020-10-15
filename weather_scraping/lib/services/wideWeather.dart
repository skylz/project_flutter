import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:weather_scraping/screen/searchLocationScreen.dart';

const String url =
    'https://www.weather.go.kr/w/wnuri-fct/weather/sfc-city-weather.do?stn=&type=t99&reg=100&tm=&unit=km%2Fh';

Future<List<Map<String, dynamic>>> getWideWeatherData() async {
  final http.Response response = await http.get(url);

  List<Map<String, dynamic>> weatherMap = [];

  String time;
  List<String> location = [];
  List<String> seeDistance = [];
  List<String> nowTemp = [];
  List<String> dewPoint = [];
  List<String> feelTemp = [];
  List<String> humid = [];
  List<String> windDirection = [];
  List<String> windSpeed = [];
  List<String> pressure = [];

  var document = parser.parse(response.body);

  // 시간
  document.querySelectorAll('body > p').forEach((dom.Element element) {
    time = element.text.substring(5);
  });

  // 지점
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(1)')
      .forEach((dom.Element element) {
    location.add(element.text);
  });

  // 날씨 시정
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(5)')
      .forEach((dom.Element element) {
    seeDistance.add(element.text);
  });

  // 현재 기온
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(11)')
      .forEach((dom.Element element) {
    nowTemp.add(element.text);
  });

  // 이슬점 온도
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(13)')
      .forEach((dom.Element element) {
    dewPoint.add(element.text);
  });

  // 체감 온도
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(15)')
      .forEach((dom.Element element) {
    feelTemp.add(element.text);
  });

  // 습도
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(19)')
      .forEach((dom.Element element) {
    humid.add(element.text);
  });

  // 풍향
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(21)')
      .forEach((dom.Element element) {
    windDirection.add(element.text);
  });

  // 풍속
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(23)')
      .forEach((dom.Element element) {
    windSpeed.add(element.text);
  });

  // 해면기압
  document
      .querySelectorAll('body > table > tbody > tr > td:nth-child(25)')
      .forEach((dom.Element element) {
    pressure.add(element.text);
  });

  // Put data into weatherMap
  for (var i = 0; i < location.length; i++) {
    weatherMap.add({
      'time': time,
      'location': location[i],
      'seeDistance': seeDistance[i],
      'nowTemp': nowTemp[i],
      'dewPoint': dewPoint[i],
      'feelTemp': feelTemp[i],
      'humid': humid[i],
      'windDirection': windDirection[i],
      'windSpeed': windSpeed[i],
      'pressuer': pressure[i]
    });
  }

  return weatherMap;
}
