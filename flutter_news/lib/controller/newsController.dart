import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/newsModel.dart';
import '../services/getNews.dart';
import 'dart:math';
import '../model/tagModel.dart';
import '../model/newsHistoryModel.dart';

class NewsController extends GetxController {
  var newsListData = List<News>().obs;
  var newsTagData = List<Tags>().obs;
  var newsHistory = List<NewsHistory>().obs;
  var backGround;

  List<String> photoList = ["money", "newspaper", "hoseini", "seoul"];

  @override
  void onInit() {
    _getNewsList();
    super.onInit();
  }

  void _getNewsList() async {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));
    try {
      newsListData.value = await GetNews().getNews();
      Get.back();
    } catch (e) {
      print(e);
    }
  }

  void getBackGroundImage() {
    int randomNumber = Random().nextInt(photoList.length);
    backGround = photoList[randomNumber];
  }
}
