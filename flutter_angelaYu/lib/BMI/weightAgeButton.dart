import 'package:flutter/material.dart';
import 'package:test2app/BMI/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    @required this.weightAgeIcon,
  });

  final IconData weightAgeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RawMaterialButton(
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(width: 40.0, height: 40.0),
        onPressed: () {},
        shape: CircleBorder(),
        fillColor: reUsableCardColor,
        child: Icon(weightAgeIcon),
      ),
    );
  }
}
