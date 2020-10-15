import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD', 'BRL', 'CAD', 'CNY', 'EUR', 'GBP', 'HKD', 'IDR', 'ILS',
  'INR', 'JPY', 'MXN', 'NOK', 'NZD', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'USD', 'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = '8D325F16-E6AF-4821-85D8-A5B9CD5F7E44';

class CoinData {
  CoinData(this.selectedCurrency);

  final String selectedCurrency;

  Future getCoinData() async {

    List valueList = [];

    for (String value in cryptoList){
      print(value);
      String requestURL = '$coinAPIURL/$value/$selectedCurrency?apikey=$apiKey';
      print(requestURL);
      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double lastPrice = decodedData['rate'];
        valueList.add(lastPrice.toStringAsFixed(0));
        print(valueList);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return valueList;
  }
}

