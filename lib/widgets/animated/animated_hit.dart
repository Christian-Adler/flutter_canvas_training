import 'package:flutter/material.dart';

import '../../painter/animated/animated_hit_painter.dart';

class AnimatedHit extends StatefulWidget {
  const AnimatedHit({Key? key}) : super(key: key);

  @override
  State<AnimatedHit> createState() => _AnimatedHitState();
}

class _AnimatedHitState extends State<AnimatedHit> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    Tween<double> tween = Tween(begin: 0, end: 1);

    // ..addListener(() {
    //   setState(() {});
    // })

    // ..addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _controller.repeat();
    //   } else if (status == AnimationStatus.dismissed) {
    //     _controller.forward();
    //   }
    // }
    // )

    // ..addStatusListener((status) {
    //   print(status.toString());
    // })
    ;

    _colorAnimation =
        tween.animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 1, curve: Curves.easeInOut)));

    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void hitHandler() {
    print('hit');
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // Groeße: Wichtig, damit im Painter Size korrekt geht. Sonst width & height = 0
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: AnimatedHitPainter(colorAnimation: _colorAnimation, onHit: hitHandler),
      ),
    );
  }
}
