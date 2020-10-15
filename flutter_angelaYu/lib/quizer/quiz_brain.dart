import 'package:flutter/cupertino.dart';
import 'package:test2app/quizer/question.dart';
import 'package:test2app/quizer/quizer.dart';

class QuizBrain {

  int _questionIndex = 0;
  int _subTitleIndex = 0;
  int _idx = 0;
  int _correctnum = 0;
  int _wrongidx = 0;

  List<Question> _questionBank = [
    Question('Quizer Game!', 'intro'),
    Question('하단의 시작하기 버튼을 먼저 눌러주세요', 'intro'),
    Question('질문에 맞는 정답을 눌러주세요.', 'intro'),
    Question('Some cats are actually allergic to humans', 'question', questionAnswer : true),
    Question('You can lead a cow down stairs but not up stairs.', 'question', questionAnswer : false),
    Question('Approximately one quarter of human bones are in the feet.', 'question', questionAnswer : true),
    Question('A slug\'s blood is green.', 'question', questionAnswer : true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', 'question', questionAnswer : true),
    Question('It is illegal to pee in the Ocean in Portugal.', 'question', questionAnswer : true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', 'question', questionAnswer : false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.'
        , 'question', questionAnswer : true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', 'question', questionAnswer : false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.', 'question', questionAnswer: true),
    Question('Google was originally called \"Backrub\".', 'question', questionAnswer: true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', 'question', questionAnswer: true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', 'question', questionAnswer: true),
    Question('모든 문제를 맞췄습니다.', 'finish'),
  ];

  List<SubTitle> _subTitleBank = [
    SubTitle('시작하기'),
    SubTitle('질문 보기'),
    SubTitle(' '),
    SubTitle('정답입니다.'),
    SubTitle('틀렸습니다. 정답을 다시 선택해주세요.'),
    SubTitle('다시하시려면 우측 상단의 다시하기를 눌러주세요.'),
  ];

  List<WrongMainTitle> _wrongQuestionBank = [
    WrongMainTitle('도전에 실패했습니다.')
  ];

  String GetQuestionText() {
    if(_idx<=30){
      return _questionBank[_questionIndex].questionText;
    }else{
      // rflutter_alert 버튼 추가하기
      return _wrongQuestionBank[_wrongidx].wrongmainquestionText;
    }
  }

  String GetSubTitleText() {
    if(_idx<=30){
      return _subTitleBank[_subTitleIndex].subquestionText;
    }else{
      // rflutter_alert 버튼 추가하기
      return _subTitleBank[5].subquestionText;
    }
  }

  bool GetCorretAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }

  String GetCorretType() {
    return _questionBank[_questionIndex].type;
  }

  void ResetPress() {
    _questionIndex = 0;
    _subTitleIndex = 0;
    _idx = 0;
  }

  // 처음 시작하기 버튼을 눌렀을 때 실행
  void SubMenuStart() {
    if (_subTitleBank[_subTitleIndex].subquestionText == '시작하기') {
      _questionIndex = 2;
      _subTitleIndex = 1;
    } else if (_subTitleBank[_subTitleIndex].subquestionText == '질문 보기'){
      _questionIndex = 3;
      _subTitleIndex = 2;
    }
  }

  void TruePress() {
    if (_questionIndex <= _questionBank.length - 2) {
      if(_questionBank[_questionIndex].questionAnswer == true){
        _subTitleIndex = 3;
        _questionIndex ++ ;
        _idx ++;
        _correctnum ++;
      }else if(_questionBank[_questionIndex].questionAnswer == false){
        _subTitleIndex = 4;
        _idx ++;
      }else if(_subTitleBank[_subTitleIndex].subquestionText == '시작하기'){
        _questionIndex = 1;
      }
    }else {
      _questionIndex = 16;
      _subTitleIndex = 5;
    }
  }

  int SubtitleReturn() {
    return _subTitleIndex;
  }

  int IndexReturn() {
    return _idx;
  }

  void FalsePress() {
    if (_questionIndex <= _questionBank.length - 2) {
      if(_questionBank[_questionIndex].questionAnswer == false){
        _subTitleIndex = 3;
        _questionIndex ++ ;
        _idx ++;
        _correctnum ++;
      }else if(_questionBank[_questionIndex].questionAnswer == true){
        _subTitleIndex = 4;
        _idx ++;
      }else if(_subTitleBank[_subTitleIndex].subquestionText == '시작하기'){
        _questionIndex = 1;
      }
    }else {
      _questionIndex = 16;
      _subTitleIndex = 5;
    }
  }

}