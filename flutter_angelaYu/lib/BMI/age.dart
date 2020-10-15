import 'package:flutter/material.dart';
import 'package:test2app/BMI/weightAgeButton.dart';
import 'constants.dart';

int ageVal = 0;

class Age extends StatefulWidget {
  @override
  _AgeState createState() => _AgeState();
}

class _AgeState extends State<Age> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('AGE',
          style: TextStyle(
              color: deActiveColor,
              fontSize: normalFontSize
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child:  Text(
            '$ageVal',
            style: kSuperLabelTextStyle
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: buttonWidth,
              height: buttonHeight,
              child: FloatingActionButton(
                heroTag: 'agePlus',
                backgroundColor: bottomCardColor,
                child: RoundIconButton(weightAgeIcon: Icons.remove,),
                onPressed: () {
                  AgeMinus();
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              width: buttonWidth,
              height: buttonHeight,
              child: FloatingActionButton(
                heroTag: 'ageMinus',
                backgroundColor: bottomCardColor,
                child: RoundIconButton(weightAgeIcon: Icons.add,),
                onPressed: () {
                  AgePlus();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void AgePlus() {
    setState(() {
      ageVal ++;
    });
  }

  void AgeMinus() {
    setState(() {
      if(ageVal > 0){
        ageVal --;
      }
    });
  }
}