import 'dart:async';
import 'package:cute_kitten/model/core/catphoto.dart';
import 'package:cute_kitten/model/glitch/glitch.dart';
import 'package:cute_kitten/model/helper/catPhotoHelper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CatProvider with ChangeNotifier, DiagnosticableTreeMixin {
  final _helper = CatPhotoHelper();
  final _streamController = StreamController<Either<Glitch, CatPhoto>>();

  // _streamController.stream에서 .stream을 통해 Stream의 결과를 출력할 수 있다.
  Stream<Either<Glitch, CatPhoto>> get catPhotoStream {
    return _streamController.stream;
  }

  // return 값이 없는 함수이기 때문에 Future<void>가 맞다.
  // 만약 return 값이 있다면 return 값을 Future<여기에 넣어줘야 한다.>
  Future<void> getTwentyRandomPhoto() async {
    for (int i = 0; i < 20; i++) {
      final catHelperResult = await _helper.getRandomCatPhoto();
      _streamController.add(catHelperResult);
    }
  }

  // refreshGrid를 위해서는 다시 20개를 호출해야 한다.
  // 따라서 위의 getTwentyRandomPhoto가 들어간다.
  void refreshGrid() {
    getTwentyRandomPhoto();
  }
}
