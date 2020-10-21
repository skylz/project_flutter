import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import '../model/weatherModel.dart';

Future<List<WeatherInfo>> getNowWeather({locationCode}) async {
  List<WeatherInfo> weatherData = [];
  List<String> rawWeatherData = [];

  final String url =
      'https://www.weather.go.kr/w/wnuri-fct/weather/today-vshortmid.do?code=$locationCode&unit=km%2Fh';

  final http.Response response = await http.get(url);
  dom.Document document = parser.parse(response.body);

  document
      .getElementsByClassName('weather-item')
      .forEach((dom.Element element) {
    rawWeatherData =
        element.text.replaceAll(RegExp(r"\s+"), ',').split(',').toList();
    rawWeatherData.removeAt(0);
    rawWeatherData.removeLast();

    weatherData.add(WeatherInfo(
        time: rawWeatherData[0],
        temp: rawWeatherData[1],
        feelTemp: rawWeatherData[2],
        humid: rawWeatherData[3],
        windDirection: rawWeatherData[4],
        windSpeed: rawWeatherData[5],
        rainfall: rawWeatherData[6]));
  });

  return weatherData;
}
