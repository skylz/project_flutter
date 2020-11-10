import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_news/model/newsModel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'newsTitleScreen.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';

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
  double _fabHeight;
  double _panelHeightOpen;
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
    _panelHeightOpen = MediaQuery.of(context).size.height * 1.0;
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: NewsTitleScreen(),
            panelBuilder: (sc) => _panel(sc),
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

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Text(
                      "${newsData.content[0].substring(0, 24)}...",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Expanded(
                child: ListView.builder(
                    controller: sc,
                    shrinkWrap: true,
                    itemCount:
                        newsData.content == null ? 0 : newsData.content.length,
                    itemBuilder: (context, index) {
                      if (newsData.content != null) {
                        return Card(
                          child: Text(newsData.content[index]),
                        );
                      } else {
                        return Card(
                          child: Text('내용이 없습니다.'),
                        );
                      }
                    })),
          ],
        ));
  }
}
