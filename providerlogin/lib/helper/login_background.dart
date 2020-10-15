import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // .. 은 get과 같은거라고 생각하면 됨.
    Paint paint = Paint()..color = Colors.blue;
    canvas.drawCircle(
        Offset(size.width / 2, size.height * 0.2), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
