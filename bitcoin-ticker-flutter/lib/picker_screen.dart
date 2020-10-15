//import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'dart:io' show Platform;
//import 'coin_data.dart';
//import 'price_screen.dart';
//
//class GetPicker extends StatefulWidget {
//  GetPicker(this.bitcoinValue, this.selectedCurrency);
//
//  String selectedCurrency;
//  String bitcoinValue;
//
//  @override
//  _GetPickerState createState() => _GetPickerState();
//}
//
//class _GetPickerState extends State<GetPicker> {
//  @override
//  Widget build(BuildContext context) {
//    return getPicker();
//  }
//
//  Widget getPicker() {
//    if (Platform.operatingSystem == 'ios') {
//      return iOSPikcer();
//    } else if (Platform.operatingSystem == 'android') {
//      return androidDropDownButton();
//    }
//  }
//
//  // Android Dropdown Button
//  DropdownButton<String> androidDropDownButton() {
//    List<DropdownMenuItem<String>> dropDownItems = [];
//    for (String currency in currenciesList) {
//      DropdownMenuItem<String> newItem = DropdownMenuItem(
//        child: Text(currency),
//        value: currency,
//      );
//      dropDownItems.add(newItem);
//    }
//
//    return DropdownButton<String>(
//        value: selectedCurrency,
//        items: dropDownItems,
//        onChanged: (value) {
//          setState(() {
//            selectedCurrency = value;
//            getData();
//          });
//        });
//  }
//
//  // IOS Picker Button
//  CupertinoPicker iOSPikcer() {
//    List<Text> PickerItems = [];
//    for (String currency in currenciesList) {
//      PickerItems.add(Text(
//        currency,
//        style: TextStyle(color: Colors.white),
//      ));
//    }
//
//    return CupertinoPicker(
//      itemExtent: 32.0,
//      onSelectedItemChanged: (selectedIndex) {
//        selectedCurrency = currenciesList[selectedIndex];
//        print(selectedCurrency);
//        getData();
//      },
//      children: PickerItems,
//    );
//  }
//
//  void getData() async {
//    try {
//      double data = await CoinData().getCoinData(selectedCurrency);
//      setState(() {
//        bitcoinValue = data.toStringAsFixed(0);
//      });
//    } catch (e) {
//      print(e);
//    }
//  }
//
//}
//
