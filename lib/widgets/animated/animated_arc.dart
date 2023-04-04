import 'package:flutter/material.dart';

import '../../painter/animated/animated_arc_painter.dart';

class AnimatedArc extends StatefulWidget {
  const AnimatedArc({Key? key}) : super(key: key);

  @override
  State<AnimatedArc> createState() => _AnimatedArcState();
}

class _AnimatedArcState extends State<AnimatedArc> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    Tween<double> tween = Tween(begin: 0.0, end: 270);

    animation = tween.animate(controller)
      // ..addListener(() {
      //   setState(() {});
      // })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.repeat();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // Groeße: Wichtig, damit im Painter Size korrekt geht. Sonst width & height = 0
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: AnimatedArcPainter(animation: animation),
      ),
    );
  }
}
