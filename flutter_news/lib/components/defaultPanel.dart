import 'package:flutter/material.dart';
import '../model/newsModel.dart';

class DefaultPanel extends StatelessWidget {
  const DefaultPanel({
    Key key,
    @required this.context,
    @required this.newsData,
    @required this.sc,
  }) : super(key: key);

  final BuildContext context;
  final News newsData;
  final ScrollController sc;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
                child: Text("${newsData.content[0].substring(0, 24)}...",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    )))
          ],
        ));
  }
}
