import 'package:flutter/material.dart';

class Question {
  String questionText;
  bool questionAnswer;
  String type;

  Question(this.questionText, this.type, {this.questionAnswer});
}

class MainTitle {
  String mainquestionText;

  MainTitle(this.mainquestionText);
}

class SubTitle {
  String subquestionText;

  SubTitle(this.subquestionText);
}

class WrongMainTitle {
  String wrongmainquestionText;

  WrongMainTitle(this.wrongmainquestionText);
}