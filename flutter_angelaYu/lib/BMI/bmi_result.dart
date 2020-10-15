import 'package:flutter/material.dart';
import 'package:test2app/BMI/input_page.dart';
import 'constants.dart';

double bmi;
String bmiState;
double downBMI;
double upBMI;

class BmiResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI RESULT'),
      ),
      body:SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Your Result',
              style: kSemiSuperLabelTextStyle
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: reUsableCardColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$bmiState',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.w600
                      ),),
                      SizedBox(
                        height: 15,
                      ),
                      Text('$bmi',
                      style: TextStyle(
                        fontSize: 80.0,
                        color: activeColor,
                        fontWeight: FontWeight.w900
                      ),),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text('Normal BMI Range',
                      style: TextStyle(
                        fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: deActiveColor
                      ),),
                      Text('$downBMI - $upBMI kg/m2',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: activeColor,
                      ),),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text('You hace a normal body weight. Good job!',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                        color: activeColor,
                      ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      ButtonTheme(
                        child: FlatButton(
                          color: buttonFillColor,
                          child: Text('SAVE RESULT',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: activeColor
                          ),),
                          onPressed: () {

                          },
                        ),
                      )
                    ],
                  ),
                )
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                color: bottomCardColor,
                margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                width: double.infinity,
                height: bottomContainerHeight,
                child: ButtonTheme(
                  child: FlatButton(
                    child: Text('RE-CALCULATE YOUR BMI',
                      style: TextStyle(
                        color: activeColor,
                        fontSize: 18.0
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
          )
      ),
    );
  }
}
