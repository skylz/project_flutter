import 'package:flutter/material.dart';
import '../controller/newsController.dart';
import 'package:get/get.dart';
import '../screen/newsContentsScreen.dart';

class HistoryContents extends StatefulWidget {
  @override
  _HistoryContentsState createState() => _HistoryContentsState();
}

class _HistoryContentsState extends State<HistoryContents> {
  final NewsController _newsController = Get.put(NewsController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        title: Text('History'),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: _newsController.newsHistory.length != 0
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: _newsController.newsHistory.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: InkWell(
                                  onTap: () {
                                    // history page가 Stack으로 싸이지 않고 Contents Screen으로 가기 위함.
                                    Get.off(NewsContentsScreen(),
                                        arguments: _newsController
                                            .newsHistory[index].routeIndex);
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    elevation: 0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(18.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, bottom: 4),
                                            child: Text(
                                                '${_newsController.newsHistory[index].heading}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    .copyWith(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4, bottom: 20),
                                            child: Text(
                                                '${_newsController.newsHistory[index].author}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4
                                                    .copyWith(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12)),
                                          ),
                                          Text(
                                              '${_newsController.newsHistory[index].historyContents}',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w300,
                                                  letterSpacing: 2.0)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                    : Center(
                        child: Text('저장한 기사가 없습니다.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            )))),
          ),
        ],
      ),
    );
  }
}
