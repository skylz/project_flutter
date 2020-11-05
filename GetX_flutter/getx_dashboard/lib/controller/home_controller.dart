import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../http/request.dart';
import '../http/url.dart';
import '../model/user_list_model.dart';
import '../model/userData.dart';
import '../model/adData.dart';

class HomeController extends GetxController {
  var userListData = List<UserData>().obs;

  @override
  void onInit() {
    _apiGetUserList();
    super.onInit();
  }

  void _apiGetUserList() {
    Future.delayed(
        Duration.zero,
        () => Get.dialog(Center(child: CircularProgressIndicator()),
            barrierDismissible: false));

    Request request = Request(url: urlUserList, body: null);
    request.get().then((value) {
      UserListModel userListModel =
          UserListModel.fromJson(jsonDecode(value.body));
      userListData.value = userListModel.data;
      Get.back();
    }).catchError((onError) {
      print(onError);
    });
  }

  void deleteItem(int index) {
    userListData.removeAt(index);
  }
}
