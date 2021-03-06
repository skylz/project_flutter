import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart' as dom;
import 'dart:convert';
import 'dart:core';
import '../model/newsModel.dart';
import '../model/commentModel.dart';

class GetNews {
  List<News> newsData = [];
  List<String> newsHeadingData = [];
  List<String> newsContentsData = [];

  // Line을 나눠주는 라이브러리
  LineSplitter ls = LineSplitter();

  Future<List<News>> getNews() async {
    for (var i = 1; i < 11; i++) {
      // news 문단별 heartState를 관리하는 과정
      List<bool> _heartFill = [];
      List<bool> _heartState = [];
      List<int> _heartCount = [];
      List<List<Comment>> _listDemoComments = [];

      final String url = 'https://minkithub.github.io/2020/11/04/news$i/';
      final http.Response response = await http.get(url);
      dom.Document document = parser.parse(response.body);

      // News MetaData를 불러오는 과정.
      document
          .getElementsByClassName('post-heading')
          .forEach((dom.Element element) {
        newsHeadingData = ls.convert(element.text);
      });
      for (var i = 0; i < newsHeadingData.length; i++) {
        newsHeadingData[i] = newsHeadingData[i].trim();
      }
      newsHeadingData.removeWhere((value) => value == '');

      // News Contents를 가져오는 과정.
      document
          .querySelectorAll(
              'body > article > div > div > div.col-lg-8.col-lg-offset-2.col-md-10.col-md-offset-1.post-container > p')
          .forEach((element) {
        newsContentsData = ls.convert(element.text);
      });
      newsContentsData.removeWhere((value) => value == '');

      newsContentsData.forEach((element) {
        List<Comment> demoCommentsCopied = demoComments.toList();
        _heartFill.add(false);
        _heartState.add(true);
        _heartCount.add(35);
        _listDemoComments.add(demoCommentsCopied);
      });

      // subheading이 없는 뉴스들이 있음.
      if (newsHeadingData.length == 5) {
        newsData.add(News(
            heading: newsHeadingData[2],
            subheading: newsHeadingData[3],
            author: newsHeadingData[4],
            content: newsContentsData,
            heartFill: _heartFill,
            heartState: _heartState,
            heartCount: _heartCount,
            listDemoComment: _listDemoComments));
      } else {
        newsData.add(News(
            heading: newsHeadingData[2],
            subheading: '',
            author: newsHeadingData[3],
            content: newsContentsData,
            heartFill: _heartFill,
            heartState: _heartState,
            heartCount: _heartCount,
            listDemoComment: _listDemoComments));
      }
    }
    // 결과적으로 newsData에 모든 정보가 다 담겨있는 구조.
    return newsData;
  }
}
