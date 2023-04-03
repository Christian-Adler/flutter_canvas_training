import 'dart:math' as math;

import 'package:flutter/material.dart';

class ShouldRepaintPainter extends CustomPainter {
  double startAngleDeg;

  ShouldRepaintPainter(this.startAngleDeg);

  double degreesToRadians(double deg) {
    return deg / 360 * 2 * math.pi;
  }

  @override
  void paint(Canvas canvas, Size size) {
    print('paint');
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.amber
      ..style = PaintingStyle.stroke;

    final arcCenter = Offset(size.width / 2, 80);
    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
    final startAngle = degreesToRadians(startAngleDeg);
    final sweepAngle = degreesToRadians(90);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant ShouldRepaintPainter oldDelegate) {
    bool shouldRep = startAngleDeg != oldDelegate.startAngleDeg;
    print('Should repaint? $shouldRep');
    return shouldRep;
  }
}
