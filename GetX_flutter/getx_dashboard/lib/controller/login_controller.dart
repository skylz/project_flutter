import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../http/request.dart';
import '../http/url.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  // One of GetxController method
  // onInit() will get called start just like initState method of the statefullWidget
  // 추후 loginView를 만드는 과정에서 email/password TextFormField의 data를 control하는데 쓰임
  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    super.onInit();
  }

  // To call the rest API and to show the loading dialog
  void apiLogin() {
    // Get.dialog() display the loading.
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    // api에서 email, password를 받아옴.
    Request request = Request(url: urlLogin, body: {
      'email': emailTextController.text,
      'password': passwordTextController.text
    });
    request.post().then((value) {
      // To close snackbars, dialogs, bottomsheets, or anything you would normally close with Navigator.pop(context)
      // 위에 있는 Get.dialog를 닫기 위함.
      Get.back();
      // homeView Screen으로 Navigator
      Get.toNamed('homeView');
    }).catchError((onError) {});
  }

  // One of GetxController method
  // onClose() will get called close just like dispose method of the statefullWidget
  // 위의 reques에서 HomeView로 넘어가는데 HomeView에서도 Controller가 쓰이니까 혹시나 하는 crash를 막기 위해
  // onClose() method를 통해서 Controller를 없애주는것.
  @override
  void onClose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.onClose();
  }
}
