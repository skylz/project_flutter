import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/newsModel.dart';
import '../services/getNews.dart';

class NewsController extends GetxController {
  var newsListData = List<News>().obs;

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
}
