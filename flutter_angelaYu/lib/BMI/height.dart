import 'package:flutter/material.dart';
import 'constants.dart';

int heightVal = 180;

class HeightSlider extends StatefulWidget {
  @override
  _HeightSliderState createState() => _HeightSliderState();
}

class _HeightSliderState extends State<HeightSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('$heightVal',
                  style: kSuperLabelTextStyle
              ),
              Text('cm',
                  style: kWeakerLabelTextStyle
              )
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: bottomCardColor,
                overlayColor: Color(0x29EB1555),
                inactiveTrackColor: deActiveColor,
                thumbColor: bottomCardColor,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0)
            ),
            child: Slider(
              value: heightVal.toDouble(),
              min: 110.0,
              max: 250.0,
              onChanged: (double _value) {
                setState(() {
                  heightVal = _value.toInt();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
