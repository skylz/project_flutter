import 'package:get/get.dart';
import '../screen/homeNewsScreen.dart';
import '../screen/newsContentsScreen.dart';

class GetXRouter {
  static final route = [
    GetPage(name: 'homeNewsScreen', page: () => HomeNewsScreen()),
    GetPage(name: 'newsContentsScreen', page: () => NewsContentsScreen())
  ];
}
