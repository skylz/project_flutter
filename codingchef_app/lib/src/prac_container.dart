import 'package:flutter/material.dart';

// Container의 크기는 안의 child의 크기에 맞추어 진다.
// Container에는 오직 하나의 child만 들어간다.
class PracContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Row(
          // 세로 정렬
//            verticalDirection: VerticalDirection.up,
//            mainAxisSize: MainAxisSize.min,
//            mainAxisAlignment: MainAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // 가로 정렬
//            crossAxisAlignment: CrossAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
//                width: 100,
                height: 100,
                color: Colors.blue,
                child: Text('Container 1'),
              ),
              SizedBox(
                height: 30.0,
                width: 30.0,
              ),
              Container(
//                width: 400,
                height: 100,
                color: Colors.red,
                child: Text('Container 2'),
              ),
              Container(
//                width: 100,
                height: 100,
                color: Colors.green,
                child: Text('Container 3'),
              ),
              Container(
//                width: double.infinity,
                height: 20.0,
              )
            ],
          ),
        ),
      )
    );
  }
}







//class PracContainer extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.deepOrange,
//      body: SafeArea(
//          child: Container(
//            color: Colors.blue,
//            width: 100,
//            height: 100,
//            margin: EdgeInsets.symmetric(
//                vertical: 50,
//                horizontal: 10
//            ),
//            padding: EdgeInsets.all(20.0),
//            child: Text('hello'),
//          )),
//    );
//  }
//}
