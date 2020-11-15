import 'package:flutter/material.dart';
import 'package:flutter_news/model/newsModel.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';
import '../model/tagModel.dart';

class Panel extends StatefulWidget {
  final BuildContext context;
  final ScrollController sc;
  final double fabHeight;
  final Map<String, List<int>> tagIndexMap;
  final List<Tags> tagsData;

  Panel(
      {this.context, this.sc, this.fabHeight, this.tagIndexMap, this.tagsData});

  @override
  _PanelState createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;
  News newsData;

  // for UI
  double _panelHeightOpen = Get.height * 1.0;

  // 태그 List
  List<String> tagList = [];
  List<String> selectedTagList = ['기사 전문'];
  List tagListFilterChip = <Widget>[];

  @override
  void initState() {
    newsData = _newsController.newsListData[titleIndex];
    tagList = widget.tagIndexMap.keys.toList().sublist(1);
    tagList.sort((a, b) => a.length.compareTo(b.length));
    tagList.insert(0, "기사전문");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F5F7),
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
            color: Color(0xFFF3F5F7),
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      newsData.heading,
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 26),
                      softWrap: true,
                    ),
                  ),
                  _subTitle(context),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      newsData.author,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Colors.black54,
                          fontWeight: FontWeight.w300,
                          fontSize: 14.0),
                      softWrap: true,
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tagList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: FilterChip(
                                label: Text('${widget.tagsData[index].tag}'),
                                labelStyle: TextStyle(
                                    color: selectedTagList.contains(
                                            widget.tagsData[index].tag)
                                        ? Colors.white
                                        : Colors.black),
                                selected: selectedTagList
                                    .contains(widget.tagsData[index].tag),
                                onSelected: (bool selected) {
                                  if (index != 0) {
                                    selectedTagList
                                        .remove(widget.tagsData[0].tag);
                                    if (selectedTagList
                                        .contains(widget.tagsData[index].tag)) {
                                      selectedTagList
                                          .remove(widget.tagsData[index].tag);
                                    } else {
                                      selectedTagList
                                          .add(widget.tagsData[index].tag);
                                    }
                                  } else {
                                    selectedTagList = ['기사 전문'];
                                  }
                                  setState(() {
                                    // 기사전문만 있을 때 기사전문을 꺼짐 방지
                                    if (selectedTagList.length == 0) {
                                      selectedTagList
                                          .add(widget.tagsData[0].tag);
                                    }
                                  });
                                  print(selectedTagList);
                                },
                                selectedColor: Theme.of(context).accentColor,
                                checkmarkColor: Colors.white,
                              ),
                            );
                          })),
                  Expanded(
                      flex: 9,
                      child: ListView.builder(
                          controller: widget.sc,
                          itemCount: newsData.content.length,
                          itemBuilder: (context, index) {
                            if (newsData.content != null) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15, left: 10, right: 10),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      newsData.content[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          .copyWith(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w300,
                                              letterSpacing: 2.0),
                                      softWrap: true,
                                    ),
                                  ),
                                ),
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
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 25, right: 25),
        child: Text(newsData.subheading == '' ? '' : newsData.subheading,
            style: Theme.of(context).textTheme.headline6.copyWith(
                color: Colors.black87,
                fontWeight: FontWeight.w300,
                fontSize: 18.0)),
      );
    } else {
      return SizedBox(height: 15);
    }
  }
}
