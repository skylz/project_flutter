import 'package:flutter/material.dart';
import 'package:flutter_news/model/newsModel.dart';
import 'package:flutter_news/screen/newsTitleScreen.dart';
import 'package:get/get.dart';

class Panel extends StatefulWidget {
  const Panel({
    Key key,
    @required this.context,
    @required this.sc,
    @required this.newsData,
    @required this.fabHeight,
  }) : super(key: key);

  final BuildContext context;
  final ScrollController sc;
  final News newsData;
  final double fabHeight;

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  @override
  Widget build(BuildContext context) {
    double _panelHeightOpen = MediaQuery.of(context).size.height * 1.0;
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
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.newsData.heading,
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w300),
                  softWrap: true,
                )
              ],
            ),
          )),
    );
  }
}
