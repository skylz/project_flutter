import 'package:flutter/material.dart';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(fontSize: 14.0),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

final kShadowColor = Color(0xFFD3D3D3).withOpacity(.84);

// Colos that use in our app
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

// 날씨 상태 Map
Map<String, dynamic> weatherState = {
  'DB01': '맑음',
  'DB01_N': '맑음',
  'DB03': '구름 많음',
  'DB03_N': '구름 많음',
  'DB09': '소나기'
};
