import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  ReusableIcon({@required this.iconVal, this.colour, this.iconSize, this.textLabel, this.textSize});

  final IconData iconVal;
  final Color colour;
  final double iconSize;
  final double textSize;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Icon(
              iconVal,
              color: colour,
              size: iconSize,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
                textLabel,
                style: TextStyle(
                  color: colour,
                  fontSize: textSize
                )
            ),
          )
        ],
      ),
    );
  }
}