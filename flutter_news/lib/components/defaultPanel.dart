import 'package:flutter/material.dart';
import '../model/newsModel.dart';
import '../controller/newsController.dart';
import 'package:get/get.dart';

class DefaultPanel extends StatelessWidget {
  final BuildContext context;
  final ScrollController sc;

  DefaultPanel({this.context, this.sc});

  final NewsController _newsController = Get.put(NewsController());
  final int titleIndex = Get.arguments;

  @override
  Widget build(BuildContext context) {
    News newsData = _newsController.newsListData[titleIndex];
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Center(
              child: Container(
                width: 30,
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text("${newsData.content[0].substring(0, 24)}...",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  )),
            )
          ],
        ));
  }
}
