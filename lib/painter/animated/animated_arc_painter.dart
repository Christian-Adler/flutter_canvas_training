import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedArcPainter extends CustomPainter {
  final Animation<double> animation;

  AnimatedArcPainter({required this.animation}) : super(repaint: animation);

  double degreesToRadians(double deg) {
    return deg / 360 * 2 * math.pi;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    const arcCenter = Offset(200, 80);
    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);
    final startAngle = degreesToRadians(0);
    final sweepAngle = degreesToRadians(animation.value);
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (animation.status != AnimationStatus.completed) {
      return true;
    } else {
      return false;
    }
  }
}
