import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({@required this.imageRoute, @required this.loginText, @required this.colour, @required this.radius, @required this.onPressed});

  final String imageRoute;
  final String loginText;
  final Color colour;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('$imageRoute'),
            Text(
              '$loginText',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            Opacity(
              opacity: 0.0,
              child: Image.asset('$imageRoute'),
            ),
          ],
        ),
        color: colour,
        onPressed: onPressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}

class MyButtonEmail extends StatelessWidget {
  MyButtonEmail({@required this.loginText, @required this.colour, this.radius, this.onPressed});

  final String loginText;
  final Color colour;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.mail,
              color: Colors.white,
            ),
            Text(
              '$loginText',
              style: TextStyle(color: Colors.black87, fontSize: 15.0),
            ),
            Opacity(
              opacity: 0.0,
              child: Icon(
                Icons.mail,
                color: Colors.white,
              ),
            ),
          ],
        ),
        color: colour,
        onPressed: onPressed,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}