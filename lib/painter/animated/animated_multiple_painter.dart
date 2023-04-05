import 'package:flutter/material.dart';

class AnimatedMultiplePainter extends CustomPainter {
  final Animation<double> widthAnimation;
  final Animation<double> heightAnimation;
  final Animation<double> colorAnimation;

  AnimatedMultiplePainter({
    required this.widthAnimation,
    required this.heightAnimation,
    required this.colorAnimation,
  }) : super(repaint: widthAnimation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Color.fromRGBO(255, 0, 0, colorAnimation.value)
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round;

    final rect = Rect.fromLTWH(10, 10, widthAnimation.value * 270, 10 + heightAnimation.value * 30);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    print(widthAnimation.status.toString());
    if (widthAnimation.status != AnimationStatus.completed) {
      print('animation completed');
      return true;
    } else {
      return false;
    }
  }
}
