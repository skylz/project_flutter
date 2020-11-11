import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/newsModel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'newsTitleScreen.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';
import '../components/panel.dart';
import '../components/defaultPanel.dart';

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

  // for UI
  // _fabHeight가 SlidingOnPanel의 높이임. 따라서 _fabHeight에 따라서 _panel이 바뀌게끔 해야함.
  double _fabHeight;
  double _panelHeightOpen = Get.height * 1.0;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    _newsController.getBackGroundImage();
    _fabHeight = _initFabHeight;
    newsData = _newsController.newsListData[titleIndex];
    super.initState();
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
            body: NewsTitleScreen(),
            panelBuilder: (sc) {
              if (_fabHeight > _initFabHeight) {
                return Panel(
                  context: context,
                  sc: sc,
                  fabHeight: _fabHeight,
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
