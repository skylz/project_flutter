import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/newsModel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'newsTitleScreen.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';
import '../components/panel.dart';
import '../components/defaultPanel.dart';
import '../model/tagModel.dart';

class NewsContentsScreen extends StatefulWidget {
  @override
  _NewsContentsScreen createState() => _NewsContentsScreen();
}

class _NewsContentsScreen extends State<NewsContentsScreen> {
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;
  final double _initFabHeight = 120.0;

  // Contain All News Data
  News newsData;

  // Tag Data Model
  List<Tags> tagsData = [];

  // for UI
  // _fabHeight가 SlidingOnPanel의 높이임. 따라서 _fabHeight에 따라서 _panel이 바뀌게끔 해야함.
  double _fabHeight;
  double _panelHeightOpen = Get.height * 1.0;
  double _panelHeightClosed = 95.0;

  // 작은 따옴표 안에 있는 단어들이 담겨있는 Map
  // singleQuotationText에 모든 정보가 다 담겨 있으므로 모든 페이지에서 해당 변수를 공유해야함.
  Map<String, List<int>> singleQuotationText = {};

  @override
  void initState() {
    _newsController.getBackGroundImage();
    _fabHeight = _initFabHeight;
    newsData = _newsController.newsListData[titleIndex];
    _singleQuotation(newsData.content);
    mapToTag(singleQuotationText);
    super.initState();
  }

  void _singleQuotation(List<String> newsContent) {
    // All tag 추가
    singleQuotationText['기사 전문'] =
        Iterable<int>.generate(newsContent.length).toList();
    for (var i = 0; i < newsContent.length; i++) {
      // 작은 따옴표 안에 있는 단어를 추출하는 코드
      RegExp regExp = RegExp(r"((\‘|\'){1}(\S+)?(\s+)*(\S+)?(\’|\'){1})");
      Iterable<Match> resSingleText = regExp.allMatches(newsContent[i]);
      // 추출된 단어들은 Map으로 변환하는 코드
      resSingleText.toList().forEach((element) {
        addValueToMap(singleQuotationText,
            element[0].replaceAll('‘', '').replaceAll('’', ''), i);
      });
    }
    print(singleQuotationText);
  }

  void addValueToMap<K, V>(Map<K, List<V>> map, K key, V value) =>
      map.update(key, (list) => list..add(value), ifAbsent: () => [value]);

  // Tags Data Model 생성
  void mapToTag(Map<String, List<int>> map) {
    map.keys.toList().forEach((element) {
      if (element == '기사 전문') {
        tagsData
            .add(Tags(tag: element, indexList: map[element], isSelected: true));
      } else {
        tagsData.add(
            Tags(tag: element, indexList: map[element], isSelected: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: NewsTitleScreen(tagIndexMap: singleQuotationText),
            panelBuilder: (sc) {
              if (_fabHeight > _initFabHeight) {
                return Panel(
                  context: context,
                  sc: sc,
                  fabHeight: _fabHeight,
                  tagIndexMap: singleQuotationText,
                  tagsData: tagsData,
                );
              } else {
                return DefaultPanel(context: context, sc: sc);
              }
            },
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                  _initFabHeight;
            }),
          ),
        ],
      ),
    );
  }
}
