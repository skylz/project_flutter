import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

// 주간 날씨

Future<List<List<String>>> getWeekWeather(
    {@required String locationCode}) async {
  final String url =
      'https://www.weather.go.kr/w/wnuri-fct/weather/today-vshortmid.do?code=$locationCode&unit=km%2Fh';

  final http.Response response = await http.get(url);
  dom.Document document = parser.parse(response.body);

  List<List<String>> nextWeekWeather = [];

  document
      .getElementsByClassName('chart-item on')
      .forEach((dom.Element element) {
    List<String> sample = [];
    sample = element.text.replaceAll(RegExp(r"\s+"), ',').split(',').toList();
    sample.remove('');
    sample.remove('/');
    sample.removeLast();
    sample[0] = sample[0].replaceAll('.', '');

    nextWeekWeather.add(sample);
  });

  return nextWeekWeather;
}
