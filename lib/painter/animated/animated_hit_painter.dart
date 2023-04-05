import 'package:flutter/material.dart';

class AnimatedHitPainter extends CustomPainter {
  final VoidCallback onHit;
  final Animation<double> colorAnimation;
  Offset? _hitPos;
  Rect _rect = const Rect.fromLTWH(10, 10, 270, 40);

  AnimatedHitPainter({
    required this.colorAnimation,
    required this.onHit,
  }) : super(
    repaint: colorAnimation,
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Zeichnen ausserhalb verhindern: canvas clipRect
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    // canvas.drawRect(
    //     rect,
    //     Paint()
    //       ..style = PaintingStyle.stroke
    //       ..color = Colors.black);
    canvas.clipRect(rect);


    // print(colorAnimation.value);
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Color.fromRGBO(255, 0, (colorAnimation.value * 255).toInt(), 1)
      ..style = PaintingStyle.fill
      ..strokeJoin = StrokeJoin.round;

    _rect = Rect.fromLTWH(10, size.height / 2, (size.width / 2), 40);
    canvas.drawRect(_rect, paint);

    if (_hitPos != null) {
      canvas.drawCircle(
          _hitPos!, colorAnimation.value * (size.width / 5), paint..color = Colors.blueAccent.withOpacity(0.5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (colorAnimation.status != AnimationStatus.completed) {
      return true;
    } else {
      return false;
    }
  }

  @override
  bool? hitTest(Offset position) {
    final hit = _rect.contains(position);
    print('hit: $hit, $position');
    if (hit) {
      onHit();
    }
    _hitPos = hit ? position : null;
    return hit;
  }
}
