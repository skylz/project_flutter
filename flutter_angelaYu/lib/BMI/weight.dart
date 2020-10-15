import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test2app/BMI/weightAgeButton.dart';
import 'constants.dart';

int weightVal = 0;

class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('WEIGHT',
            style: TextStyle(
                color: deActiveColor,
                fontSize: normalFontSize
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '$weightVal',
            style: kSuperLabelTextStyle
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: buttonWidth,
                height: buttonHeight,
                child: FloatingActionButton(
                  heroTag: 'weightPlus',
                  backgroundColor: bottomCardColor,
                  child: RoundIconButton(weightAgeIcon: Icons.remove,),
                  onPressed: () {
                    WeightMinus();
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
                  heroTag: 'weightMinus',
                  backgroundColor: bottomCardColor,
                  child: RoundIconButton(weightAgeIcon: Icons.add,),
                  onPressed: () {
                    WeightPlus();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void WeightPlus() {
    setState(() {
      weightVal ++;
    });
  }

  void WeightMinus() {
    setState(() {
      if (weightVal > 0) {
        weightVal--;
      }
    });
  }
}
