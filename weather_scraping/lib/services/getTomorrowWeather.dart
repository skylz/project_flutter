import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;

// 내일, 모레 상세 날씨 url

Future<List<List<String>>> getTomorrowWeather(
    {@required String locationCode}) async {
  final String tomorrowWeatherUrl =
      'https://www.weather.go.kr/process/home/index.dongforecast.ajax.jsp?code=$locationCode&x=59&y=125&unit=K';

  // weatherinfo = [[최고/최저 온도], [날씨 상태], [시간], [온도], [체감온도], [풍속], [습도], [강수확률]]
  List<List<String>> weatherinfo = [];

  final http.Response response = await http.get(tomorrowWeatherUrl);
  dom.Document document = parser.parse(response.body);

  // 내일, 모레 최저온도 및 최고온도 출력
  document
      .querySelectorAll(
          'body > div.tab01 > div.in-wid > ul.m-tb.m-tb-date.bd-top.clearfix')
      .forEach((element) {
    String value;
    List<String> sample = [];
    // 모든 문자 제거 => 출력 : [7, 15, 19, 29, 7, 16, 20, 31] 월, 일, 최저온도, 최고온도
    value = element.text.replaceAll(RegExp(r'[^\w\s]'), '');
    sample = value.replaceAll(RegExp(r"\s+"), ',').split(',').toList();
    sample.removeAt(0);
    sample.removeLast();
    weatherinfo.add(sample);
  });

  // 흐림, 맑음 등 추출
  // 이미지에 해당하는 날씨 상태를 map의 key가 되도록 표현
  document
      .querySelectorAll(
          'body > div.tab01 > div.in-wid > ul.m-tb.wid83.pd67.bd-no.img01.clearfix')
      .forEach((element) {
    var re = RegExp(r'(?<=DY)(.*)(?=png)');
    List<String> sample = [];
    List<String> data = element.innerHtml
        .toString()
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .split(' ')
        .toList();
    for (String str in data) {
      var match = re.firstMatch(str);
      if (match != null) sample.add(match.group(0));
    }
    weatherinfo.add(sample);
  });

  document
      .getElementsByClassName('m-tb wid83 bd-no clearfix')
      .forEach((element) {
    List<String> sample = [];
    sample = element.text
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .replaceAll(RegExp(r"\s+"), ",")
        .split(',')
        .toList();
    sample.removeAt(0);
    sample.removeLast();
    weatherinfo.add(sample);
  });

  // 강수량 추출
  document
      .querySelectorAll(
          'body > div.tab01 > div.in-wid > ul.m-tb.wid166.bd-top.clearfix')
      .forEach((element) {
    List<String> sample = [];
    sample = element.text.replaceAll(RegExp(r"\s+"), ",").split(',').toList();
    sample.removeAt(0);
    sample.removeLast();
    weatherinfo.add(sample);
  });

  weatherinfo.removeAt(2);
  return weatherinfo;
}
