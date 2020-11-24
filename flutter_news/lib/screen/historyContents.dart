import 'package:flutter/material.dart';
import '../controller/newsController.dart';
import 'package:get/get.dart';

class HistoryContents extends StatefulWidget {
  @override
  _HistoryContentsState createState() => _HistoryContentsState();
}

class _HistoryContentsState extends State<HistoryContents> {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: AppBar(
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
              child: ListView.builder(
                  itemCount: _newsController.newsHistory.length,
                  itemBuilder: (context, index) {
                    if (_newsController.newsHistory.length != 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          elevation: 0,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                    '${_newsController.newsHistory[index]}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300,
                                        letterSpacing: 2.0)),
                              ),
                              // SizedBox(
                              //   height: 20,
                              // )
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: Text('History가 없습니다.'),
                      );
                    }
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
