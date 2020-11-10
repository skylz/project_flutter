import 'package:flutter/material.dart';
import '../controller/newsController.dart';
import 'package:get/get.dart';

class HomeNewsScreen extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Obx(() => ListView.builder(
                    itemCount: _newsController.newsListData.length,
                    itemBuilder: (context, index) => ListTile(
                          title:
                              Text(_newsController.newsListData[index].heading),
                          subtitle: Text(
                              _newsController.newsListData[index].subheading),
                          onTap: () {
                            Get.toNamed('newsContentsScreen', arguments: index);
                          },
                        ))))
          ],
        ),
      ),
    );
  }
}
