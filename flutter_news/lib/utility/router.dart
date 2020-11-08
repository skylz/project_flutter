import 'package:get/get.dart';
import '../screen/homeNewsScreen.dart';
import '../screen/newsTitleScreen.dart';

class GetXRouter {
  static final route = [
    GetPage(name: 'homeNewsScreen', page: () => HomeNewsScreen()),
    GetPage(name: 'newsContentsScreen', page: () => NewsContentsScreen())
  ];
}
