import 'package:get/get.dart';
import '../view/home_view.dart';
import '../view/login_view.dart';

class GetXRouter {
  static final route = [
    GetPage(name: 'loginView', page: () => LoginView()),
    GetPage(name: 'homeView', page: () => HomeView())
  ];
}
