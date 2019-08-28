import 'package:flutter/material.dart';

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Color(0x44FEDC21);
    
    Path topLayer = new Path()
      ..moveTo(0 , size.height / 2+60)
      ..cubicTo(
        size.width / 2, (size.height / 2-20),
        size.width / 2+ 70, (size.height / 2+60),
        size.width, (size.height / 2+200),
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close()
    ;

    canvas.drawPath(topLayer, paint);

    topLayer = new Path()
      ..moveTo(0 , size.height / 2 + 150)
      ..cubicTo(
        size.width / 2, (size.height / 2 + 140),
        size.width / 2- 00, (size.height / 2-50),
        size.width, (size.height / 2+30)
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close()
    ;

    canvas.drawPath(topLayer, paint);

    topLayer = new Path()
      ..moveTo(0 , size.height / 2 + 230)
      ..cubicTo(
        size.width / 2, (size.height / 2 + 240),
        size.width / 2- 00, (size.height / 2),
        size.width, (size.height / 2)
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close()
    ;

    canvas.drawPath(topLayer, paint);

    paint.color = Color(0xFFFEDC21);

    Path bottomLayer = new Path()
      ..moveTo(size.width , (size.height / 2) + 230)
      ..cubicTo(
        size.width / 2-50, (size.height / 2) + 150,
        size.width / 2, (size.height / 2) + 300,
        0, (size.height / 2) + 320
      )
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close()
    ;


    canvas.drawPath(bottomLayer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}