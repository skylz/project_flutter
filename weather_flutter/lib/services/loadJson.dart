import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

// rootBundle을 통해 assets 내부의 파일에 다이렉트로 접근할 수 있다.
Future<String> _loadFromAsset() async {
  return await rootBundle.loadString("assets/dataset/weather_dict.json");
}

Future parseJson() async {
  // _loadFromAsset을 통해 json 객체를 불러오고 이를 jsonString에 담는다.
  String jsonString = await _loadFromAsset();
  // json 데이터 구조를 Map<String, dynamic>으로 만들어 주기 위해 jsonDecode를 사용.
  final jsonResponse = jsonDecode(jsonString);
  return jsonResponse;
}
