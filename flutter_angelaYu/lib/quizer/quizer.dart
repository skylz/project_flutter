import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test2app/quizer/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

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

  List<Widget> scoreKeeper = [];
  List<Widget> scoreKeeper2 = [];

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
                  width: 140,
                ),
                ButtonTheme(
                    child: FlatButton(
                      color: Colors.transparent,
                      child: Text('다시하기',
                        style: TextStyle(
                            color: Colors.white
                        ),),
                      onPressed: () {
                        setState(() {
                          quizBrain.ResetPress();
                          scoreKeeper = [];
                          scoreKeeper2 = [];
                        });
                      }
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
                          quizBrain.GetQuestionText(),
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
                          onPressed: () {
                            setState(() {
                              quizBrain.SubMenuStart();
                            });
                          },
                          child: Text(
                            quizBrain.GetSubTitleText(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 16.0,
                                fontFamily: 'SourceSansPro'),
                          ),
//                          onPressed: () => quizBrain.SubMenuStart(),
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
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                  quizBrain.TruePress();
                  if (quizBrain.SubtitleReturn() == 5){
                    Alert(
                        context: context,
                        title: "congratulations",
                        desc: "모든 문제를 맞췄어요!").show();
                  }else if (quizBrain.IndexReturn() > 30){
                    Alert(
                        context: context,
                        title: "FAIL!",
                        desc: "도전에 실패했습니다.").show();
                  }
                });
              },
              child: Text(
                'True',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
//              onPressed: () => quizBrain.TruePress(),
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
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                  quizBrain.FalsePress();
                  if (quizBrain.SubtitleReturn() == 5){
                    Alert(
                        context: context,
                        title: "congratulations",
                        desc: "모든 문제를 맞췄어요!").show();
                  } else if (quizBrain.IndexReturn() > 30){
                    Alert(
                        context: context,
                        title: "FAIL!",
                        desc: "도전에 실패했습니다.").show();
                  }
                });
              },
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.bold,
                ),
              ),
//              onPressed: () => quizBrain.FalsePress(),
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
            child: Column(
              children: [
                Row(
                  children: scoreKeeper,
                ),
                Row(
                  children: scoreKeeper2,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void checkAnswer(bool userPickedAnswer) {
    if(quizBrain.GetCorretType() == 'question'){
      if(scoreKeeper.length <= 14){
        if (userPickedAnswer == quizBrain.GetCorretAnswer()){
          scoreKeeper.add(
              Icon(Icons.check,
                color: Colors.greenAccent,)
          );
        }else {
          scoreKeeper.add(
              Icon(Icons.close,
                color: Colors.redAccent,)
          );
        }
      }else{
        if(scoreKeeper2.length <= 14){
          if (userPickedAnswer == quizBrain.GetCorretAnswer()){
            scoreKeeper2.add(
                Icon(Icons.check,
                  color: Colors.greenAccent,)
            );
          }else {
            scoreKeeper2.add(
                Icon(Icons.close,
                  color: Colors.redAccent,)
            );
          }
        }
      }
    }
  }


}