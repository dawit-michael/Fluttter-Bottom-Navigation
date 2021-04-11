import 'package:flutter/material.dart';

/// Custom bottom bar painter
class Painter extends CustomPainter {
  final Color backgroundColor;

  Painter({Key key, this.backgroundColor = Colors.white});
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.06923077, 0);
    path_0.lineTo(size.width * 0.3984205, 0);
    path_0.cubicTo(
        size.width * 0.3984205,
        0,
        size.width * 0.4147615,
        size.height * -0.01273507,
        size.width * 0.4195923,
        size.height * 0.1215844);
    path_0.cubicTo(
        size.width * 0.4254333,
        size.height * 0.2478195,
        size.width * 0.4429769,
        size.height * 0.4781084,
        size.width * 0.5000000,
        size.height * 0.4781084);
    path_0.cubicTo(
        size.width * 0.5564590,
        size.height * 0.4781084,
        size.width * 0.5740462,
        size.height * 0.2527020,
        size.width * 0.5802897,
        size.height * 0.1192953);
    path_0.cubicTo(size.width * 0.5820231, size.height * 0.07187563,
        size.width * 0.5830128, 0, size.width * 0.6009974, 0);
    path_0.lineTo(size.width * 0.9307692, 0);
    path_0.arcToPoint(Offset(size.width, size.height * 0.3911796),
        radius:
            Radius.elliptical(size.width * 0.06923077, size.height * 0.3911796),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width, size.height * 0.9996813);
    path_0.lineTo(0, size.height * 0.9996813);
    path_0.lineTo(0, size.height * 0.3911796);
    path_0.arcToPoint(Offset(size.width * 0.06923077, 0),
        radius:
            Radius.elliptical(size.width * 0.06923077, size.height * 0.3911796),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
