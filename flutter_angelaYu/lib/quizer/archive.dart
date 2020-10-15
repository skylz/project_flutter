// dart List에서 List value에 해당하는 index를 찾고 싶으면 다음과 같은 명령어를 사용하면 된다.
// List.indexOf(String Value);
// dart List에서 원하는 index에 value를 넣기 위해서는 다음과 같은 명령어를 사용하면 된다.
// List.insert(int index, String Value);

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: QuizPage(),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> scorekeeper = [];
  List<String> questionList = [
    '하단의 시작하기 버튼을 먼저 눌러주세요',
    '질문에 맞는 정답을 눌러주세요.',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    '모든 문제를 맞췄습니다.'
  ];

  List<String> SubTitleList = [
    '시작하기',
    '정답입니다.',
    '틀렸습니다. 정답을 다시 선택해주세요.',
    '다시하시려면 우측 상단의 다시하기를 눌러주세요.',
    ' '
  ];

  int questionIndex = 1;
  int subTitleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Main Page',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                SizedBox(
                  width: 190,
                ),
                ButtonTheme(
                    child: FlatButton(
                      color: Colors.transparent,
                      child: Text('다시하기',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      onPressed: () => ResetPress(),
                    )
                )
              ],
            ),
          ),
          Expanded(
              flex: 5,
              child: Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          questionList[questionIndex],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'SourceSansPro'),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          color: Colors.transparent,
                          child: Text(
                            SubTitleList[subTitleIndex],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16.0,
                                fontFamily: 'SourceSansPro'),
                          ),
                          onPressed: () => SubMenuList(),
                        ),
                      ],
                    ),
                  ))),
          SizedBox(
              height: 50.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                    child: Text(
                      '정답을 체크해주세요',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                ],
              )),
          ButtonTheme(
            minWidth: 200,
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: FlatButton(
              color: Colors.greenAccent,
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => TruePress(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ButtonTheme(
            minWidth: 200,
            padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            child: FlatButton(
              color: Colors.redAccent,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => FalsePress(),
            ),
          ),
          SizedBox(
              height: 70.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 15, 0, 0),
                    child: Text(
                      'score',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    indent: 30.0,
                    endIndent: 30.0,
                  ),
                ],
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 10.0),
            child: Row(
              children: scorekeeper,
            ),
          )
        ],
      ),
    );
  }

  void TruePress() {
    setState(() {
      while (questionIndex < 5) {
        if (questionIndex > 1) {
          if (questionIndex != 2) {
            scorekeeper.add(Icon(
              Icons.check,
              color: Colors.greenAccent,
            ));
            subTitleIndex = 1;
            questionIndex ++;
            if (questionIndex == 5) {
              subTitleIndex = 3;
            }
          } else {
            scorekeeper.add(Icon(
              Icons.close,
              color: Colors.redAccent,
            ));
            subTitleIndex = 2;
          }
        } else {
          questionIndex = 0;
        }
        break;
      }
    });
  }

  void FalsePress() {
    setState(() {
      while (questionIndex < 5) {
        if (questionIndex > 1) {
          if (questionIndex == 2) {
            scorekeeper.add(Icon(
              Icons.check,
              color: Colors.greenAccent,
            ));
            subTitleIndex = 1;
            questionIndex ++;
            if (questionIndex == 5) {
              subTitleIndex = 3;
            }
          } else {
            scorekeeper.add(Icon(
              Icons.close,
              color: Colors.redAccent,
            ));
            subTitleIndex = 2;
          }
        } else {
          questionIndex = 0;
        }
        break;
      }
    });
  }

  void ResetPress() {
    setState(() {
      scorekeeper = [];
      questionIndex = 1;
      subTitleIndex = 0;
    });
  }

  void SubMenuList() {
    setState(() {
      if (subTitleIndex == 0) {
        questionIndex = 2;
        subTitleIndex = 4;
      }
    });
  }
}