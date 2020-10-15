import 'package:flutter/material.dart';
import 'package:netlflixcloneapp/model/model_movie.dart';

// 영화 데이터를 백엔드에서 가져와야하기 때문.
class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

//  영화 더미데이터 생성
class _HomeScreenState extends State<HomeScreen> {
  List<Movie> movies = [
    Movie.fromMap({
      'title' : '사랑의 불시착',
      'keyword' : '사랑/로맨스/판타지',
      'poster' : 'love_poster.jpg',
      'like' : false
    })
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TopBar();
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 7, 20, 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            fit: BoxFit.contain,
            height: 25,
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              'TV 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '영화',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 1),
            child: Text(
              '내가 찜한 프로그램',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
