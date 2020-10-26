import 'dart:convert';
import 'package:cute_kitten/model/core/catphoto.dart';
import 'package:cute_kitten/model/glitch/glitch.dart';
import 'package:cute_kitten/model/glitch/noInternetGlitch.dart';
import 'package:cute_kitten/model/service/catPhotosApi.dart';
import 'package:dartz/dartz.dart';

// 결과적으로 최종 return 값을 반환하는 class

class CatPhotoHelper {
  final CatPhotoApi api = CatPhotoApi();
  Future<Either<Glitch, CatPhoto>> getRandomCatPhoto() async {
    // apiResult에는 response.body가 담기고 이는 String type
    final apiResult = await api.getRandomCatPhoto();
    return apiResult.fold((l) {
      return Left(NoInternetGlitch());
    }, (r) {
      // jsonDecode를 통해 String json type을 Map<String, dynamic>으로 변경
      final photo = CatPhoto.fromMap(jsonDecode(r)[0]);
      return Right(photo);
    });
  }
}
