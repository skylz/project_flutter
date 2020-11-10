import 'package:flutter/material.dart';

class Panel extends StatelessWidget {
  const Panel({
    Key key,
    @required this.context,
    @required this.sc,
  }) : super(key: key);

  final BuildContext context;
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
                child: Text("여기를 새롭게 바꾸면 된다!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    )))
          ],
        ));
  }
}
