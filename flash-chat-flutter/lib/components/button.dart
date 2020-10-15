import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  NormalButton({this.elevationValue, this.colour, @required this.onPressed, this.name});

  final double elevationValue;
  final Color colour;
  final Function onPressed;
  final Text name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: elevationValue,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: name
        ),
      )
    );
  }
}