import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';
import 'package:weather_scraping/model/todayweather.dart';

Future<List<List<String>>> getNowWeather(
    {@required String locationCode}) async {
  final String url =
      'https://www.weather.go.kr/w/wnuri-fct/weather/today-vshortmid.do?code=$locationCode&unit=km%2Fh';

  List<List<String>> weatherPerTime = [];

  final http.Response response = await http.get(url);
  dom.Document document = parser.parse(response.body);

  document
      .getElementsByClassName('weather-item')
      .forEach((dom.Element element) {
    List<String> sample = [];
    sample = element.text.replaceAll(RegExp(r"\s+"), ',').split(',').toList();
    sample.removeAt(0);
    sample.removeLast();

    List<TodayWeather> todayWeather = [
      TodayWeather(
          time: sample[0],
          temp: sample[1],
          feelTemp: sample[2],
          humid: sample[3],
          windDirction: sample[4],
          windSpeed: sample[5],
          rainfall: sample[6])
    ];

    weatherPerTime.add(sample);
  });

  return weatherPerTime;
}
