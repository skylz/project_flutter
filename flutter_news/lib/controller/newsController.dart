import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/newsModel.dart';
import '../services/getNews.dart';
import 'dart:math';

class NewsController extends GetxController {
  var newsListData = List<News>().obs;
  var backGround;
  List<String> photoList = ["oliagozha", "sunflower"];

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
    int randomNumber = Random().nextInt(2);
    backGround = photoList[randomNumber];
  }
}
