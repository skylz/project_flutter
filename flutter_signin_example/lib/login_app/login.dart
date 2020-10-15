import 'package:flutter/material.dart';
import 'package:signin2/login_app/my_button.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Sign In',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0.2,
        ),
        body: _buildButton());
  }
}

Widget _buildButton() {
  return Padding(
    padding: EdgeInsets.all(16.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        MyButton(
          imageRoute: 'images/glogo.png',
          loginText: 'Login with Google',
          colour: Colors.white,
          radius: 4.0,
          onPressed: () {},
        ),
        SizedBox(
          height: 10.0,
        ),
        MyButton(
          imageRoute: 'images/flogo.png',
          loginText: 'Login with Facebook',
          colour: Color(0xFF334D92),
          radius: 4.0,
          onPressed: () {},
        ),
        SizedBox(
          height: 10.0,
        ),
        MyButtonEmail(
          loginText: 'Login with Email',
          colour: Colors.green,
          radius: 4.0,
          onPressed: () {},
        ),
      ],
    ),
  );
}
