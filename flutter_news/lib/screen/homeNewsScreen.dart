import 'package:flutter/material.dart';
import '../controller/newsController.dart';
import 'package:get/get.dart';

class HomeNewsScreen extends StatelessWidget {
  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F5F7),
      appBar: AppBar(
        elevation: 0,
        title: Text('OffNews'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 5),
            child: InkWell(
                onTap: () {
                  Get.toNamed('historyContents');
                },
                child: Icon(Icons.assignment_outlined)),
          )
        ],
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
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 8, right: 8),
                              child: ListTile(
                                title: Text(
                                    _newsController.newsListData[index].heading,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16)),
                                subtitle: _newsController
                                            .newsListData[index].subheading !=
                                        ''
                                    ? Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                            '${_newsController.newsListData[index].subheading},',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4
                                                .copyWith(
                                                    color: Colors.black87,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14)),
                                      )
                                    : null,
                                onTap: () {
                                  _newsController.titleIndex = index;
                                  Get.toNamed('newsContentsScreen');
                                },
                              ),
                            ),
                          ),
                        ))))
          ],
        ),
      ),
    );
  }
}
