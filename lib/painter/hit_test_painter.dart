import 'package:flutter/material.dart';

class HitTestPainter extends CustomPainter {
  final rect = const Rect.fromLTWH(20, 20, 100, 50);

  @override
  void paint(Canvas canvas, Size size) {
    // print(size);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.amber
      ..style = PaintingStyle.fill;

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  @override
  bool? hitTest(Offset position) {
    final hit = rect.contains(position);
    print('hit: $hit');
    return hit;
  }
}
