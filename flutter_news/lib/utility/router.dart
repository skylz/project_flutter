import 'package:get/get.dart';
import '../screen/homeNewsScreen.dart';
import '../screen/newsContentsScreen.dart';
import '../screen/historyContents.dart';
import '../screen/commentScreen.dart';

class GetXRouter {
  static final route = [
    GetPage(name: 'homeNewsScreen', page: () => HomeNewsScreen()),
    GetPage(name: 'newsContentsScreen', page: () => NewsContentsScreen()),
    GetPage(name: 'historyContents', page: () => HistoryContents()),
    GetPage(name: 'commentScreen', page: () => CommentScreen())
  ];
}
