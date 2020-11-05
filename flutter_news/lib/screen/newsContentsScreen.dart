import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';

class NewsContentsScreen extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_newsController.newsListData[titleIndex].heading}',
                style: TextStyle(color: Colors.black, fontSize: 30)),
            Expanded(
                child: ListView.builder(
                    itemCount:
                        _newsController.newsListData[titleIndex].content.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(_newsController
                              .newsListData[titleIndex].content[index]),
                        )))
          ],
        ),
      ),
    );
  }
}
