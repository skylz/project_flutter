import 'dart:convert';
import 'package:flutter/services.dart';

// load json file
Future<String> _loadFromAsset() async {
  return await rootBundle.loadString("assets/dataset/weather_dict.json");
}

Future parseJson() async {
  String jsonString = await _loadFromAsset();
  final jsonResponse = jsonDecode(jsonString);
  return jsonResponse;
}
