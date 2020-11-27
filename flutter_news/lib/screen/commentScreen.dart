import 'package:flutter/material.dart';
import 'package:flutter_news/model/commentModel.dart';
import 'package:get/get.dart';
import '../controller/newsController.dart';
import '../model/newsModel.dart';
import '../model/newsHistoryModel.dart';

class CommentScreen extends StatefulWidget {
  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final NewsController _newsController = Get.put(NewsController());
  final String textContent = Get.arguments[0];
  final News newsData = Get.arguments[1];
  final int contentsIndex =
      Get.arguments[2]; //tagIndexListForListBuilder[index]
  final int titleIndex = Get.arguments[3]; //titleIndex

  // 댓글을 처리하기 위함
  final TextEditingController _commentController = TextEditingController();
  String comment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: 10),
      //     child: IconButton(
      //       icon: Icon(
      //         Icons.arrow_back_ios,
      //         color: Colors.black,
      //       ),
      //       onPressed: () {
      //         Get.back();
      //       },
      //     ),
      //   ),
      //   brightness: Brightness.light,
      //   title: Text(
      //     'OffNews',
      //     style: TextStyle(
      //         fontFamily: 'DancingScript',
      //         color: Colors.black,
      //         fontWeight: FontWeight.w400,
      //         fontSize: 20),
      //   ),
      // ),
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text('${newsData.heading}',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        // letterSpacing: 1.0,
                        height: 1.2)),
                SizedBox(
                  height: 5,
                ),
                Text('${newsData.author}',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.black87,
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        // letterSpacing: 1.5,
                        height: 1.3)),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      // color: Color(0xFFF3F5F7),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Text('$textContent',
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: Colors.black87,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: 1.2,
                            height: 1.3)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              child: Icon(
                                newsData.heartFill[contentsIndex]
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Colors.red,
                                size: 25,
                              ),
                              onTap: () {
                                // heart 채울지 말지 결정
                                newsData.heartFill[contentsIndex] =
                                    newsData.heartState[contentsIndex];

                                if (newsData.heartFill[contentsIndex]) {
                                  // heartCount 증가
                                  newsData.heartCount[contentsIndex]++;

                                  // Histroy에 데이터 추가
                                  _newsController.newsHistory.add(NewsHistory(
                                      heading: newsData.heading,
                                      author: newsData.author,
                                      historyContents:
                                          newsData.content[contentsIndex],
                                      routeIndex: titleIndex));
                                } else {
                                  // heartCount 감소
                                  newsData.heartCount[contentsIndex]--;

                                  // Histroy에 데이터 제거
                                  _newsController.newsHistory.removeWhere(
                                      (item) =>
                                          item.historyContents ==
                                          newsData.content[contentsIndex]);
                                }

                                setState(() {
                                  newsData.heartState[contentsIndex] =
                                      !newsData.heartState[contentsIndex];
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('${newsData.heartCount[contentsIndex]}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        letterSpacing: 1.5,
                                        height: 1.3)),
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 0.5,
                        width: 20,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.chat_outlined,
                              color: Colors.red,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                '${newsData.listDemoComment[contentsIndex].length}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      // letterSpacing: 1.5,
                                    ))
                          ],
                        ),
                      ),
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 0.5,
                        width: 20,
                      ),
                      // 공유
                      Container(
                        child: Row(
                          children: [
                            Icon(
                              Icons.ios_share,
                              color: Colors.red,
                              size: 25,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('공유',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      // letterSpacing: 1.5,
                                    ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                      reverse: false,
                      shrinkWrap: true,
                      itemCount: newsData.listDemoComment[contentsIndex].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                          '${newsData.listDemoComment[contentsIndex][newsData.listDemoComment[contentsIndex].length - index - 1].userName}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Text(
                                          '${newsData.listDemoComment[contentsIndex][newsData.listDemoComment[contentsIndex].length - index - 1].commentDate}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12)),
                                    ),
                                    Text(
                                        '${newsData.listDemoComment[contentsIndex][newsData.listDemoComment[contentsIndex].length - index - 1].comment}',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Divider(
                                      thickness: 0.2,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 0, right: 0, bottom: 10, top: 10),
                  child: Container(
                    alignment: Alignment(0.0, 1.0),
                    child: TextFormField(
                      controller: _commentController,
                      onChanged: (value) {
                        setState(() {
                          comment = value;
                        });
                      },
                      decoration: InputDecoration(
                          fillColor: Color(0xFFF3F5F7),
                          hintText: '해당 기사의 문단에 의견을 남겨주세요.',
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          contentPadding: EdgeInsets.all(16),
                          prefixIcon: Icon(
                            Icons.account_circle_outlined,
                            color: Colors.black38,
                          ),
                          suffix: InkWell(
                            child: Text('댓글',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: comment != ''
                                          ? Colors.red
                                          : Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      // letterSpacing: 1.5,
                                    )),
                            onTap: () {
                              if (comment != '') {
                                setState(() {
                                  newsData.listDemoComment[contentsIndex].add(
                                      Comment(
                                          userName: 'now****',
                                          commentDate: '2020.11.25. 10:35:11',
                                          comment: comment));
                                });
                                _commentController.clear();
                              }
                            },
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
