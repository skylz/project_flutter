import 'package:flutter/material.dart';
import 'package:flutter_news/model/newsModel.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';

class Panel extends StatefulWidget {
  final BuildContext context;
  final ScrollController sc;
  final double fabHeight;

  Panel({this.context, this.sc, this.fabHeight});

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;
  News newsData;

  // title, subtitle, date controller
  bool closeTopContainer = false;
  double topContainer = 0;

  // for UI
  double _panelHeightOpen = Get.height * 1.0;

  @override
  void initState() {
    newsData = _newsController.newsListData[titleIndex];
    super.initState();
    widget.sc.addListener(() {
      double value = widget.sc.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = widget.sc.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        brightness: widget.fabHeight > _panelHeightOpen
            ? Brightness.light
            : Brightness.dark,
        title: Text(
          'OffNews',
          style: TextStyle(
              fontFamily: 'DancingScript',
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
      ),
      body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: closeTopContainer ? 0 : 1,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: Get.width,
                      alignment: Alignment.topCenter,
                      height: closeTopContainer ? 0 : Get.height * 0.3,
                      child: Column(
                        children: [
                          Text(
                            newsData.heading,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                            softWrap: true,
                          ),
                          _subTitle(context),
                          Text(
                            newsData.author,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w300),
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          controller: widget.sc,
                          itemCount: newsData.content.length,
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
                          }))
                ],
              ),
            ),
          )),
    );
  }

  _subTitle(BuildContext context) {
    if (newsData.subheading != '') {
      return Padding(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Text(newsData.subheading == '' ? '' : newsData.subheading,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black87, fontWeight: FontWeight.w300)),
      );
    } else {
      return SizedBox(height: 15);
    }
  }
}
