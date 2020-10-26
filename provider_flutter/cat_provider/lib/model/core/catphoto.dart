import 'dart:convert';

import 'package:dartz/dartz.dart';

class CatPhoto {
  final String id;
  final String url;
  final int width;
  final int height;

  CatPhoto({this.id, this.url, this.width, this.height});

  static CatPhoto fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CatPhoto(
        id: map['id'],
        url: map['url'],
        width: map['width'],
        height: map['heifht']);
  }
}
