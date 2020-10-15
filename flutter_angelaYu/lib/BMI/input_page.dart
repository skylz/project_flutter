// enum, ternary blog posting

// blog에 정리할 것.
// 1. 위젯 class 형태로 생성
// 2. class 위젯 내 변수 설정하면서 const와 final 변수의 차이점

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test2app/BMI/age.dart';
import 'package:test2app/BMI/bmi_result.dart';
import 'package:test2app/BMI/constants.dart';
import 'package:test2app/BMI/height.dart';
import 'package:test2app/BMI/reusablecard.dart';
import 'package:test2app/BMI/reusableicon.dart';
import 'package:test2app/BMI/weight.dart';
import 'bmi_brain.dart';
import 'constants.dart';
import 'dart:math';

enum Gender {male, female}
Gender selectedGender;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          backgroundColor: Color(0xFF0A0E21),
          title: Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          child: ReusableCard(
                            colorVal: selectedGender == Gender.male ? bottomCardColor : reUsableCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableIcon(
                                  iconVal: FontAwesomeIcons.mars,
                                  colour: selectedGender == Gender.male ? activeColor : deActiveColor,
                                  iconSize: 80,
                                  textLabel: 'Male',
                                  textSize: 18.0,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          child: ReusableCard(
                            colorVal: selectedGender == Gender.female ? bottomCardColor : reUsableCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ReusableIcon(
                                  iconVal: FontAwesomeIcons.venus,
                                  colour: selectedGender == Gender.female ? activeColor : deActiveColor,
                                  iconSize: 80,
                                  textLabel: 'Female',
                                  textSize: 18.0,
                                ),
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ReusableCard(
                    colorVal: reUsableCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('HEIGHT',
                          style: labelTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          HeightSlider()
                        ],
                      ),
                    )
                  )
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ReusableCard(
                          colorVal: reUsableCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Weight(),
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        child: ReusableCard(
                          colorVal: reUsableCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Age(),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                color: bottomCardColor,
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                width: double.infinity,
                height: bottomContainerHeight,
                child: ButtonTheme(
                  child: FlatButton(
                    child: Text('CALCULATE YOUR BMI',
                      style: TextStyle(
                        color: activeColor,
                        fontSize: 18.0
                      ),
                    ),
                    onPressed: () {
                      BMICalculator();
                      BMIState();
                      Navigator.pushNamed(context, '/bmiResult');
                    },
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}