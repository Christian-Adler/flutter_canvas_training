import 'package:flutter/material.dart';

import '../../painter/animated/animated_multiple_painter.dart';

class AnimatedMultiple extends StatefulWidget {
  const AnimatedMultiple({Key? key}) : super(key: key);

  @override
  State<AnimatedMultiple> createState() => _AnimatedMultipleState();
}

class _AnimatedMultipleState extends State<AnimatedMultiple> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late Animation<double> _heightAnimation;
  late Animation<double> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    Tween<double> tween = Tween(begin: 0, end: 1);

    _widthAnimation =
            tween.animate(CurvedAnimation(parent: _controller, curve: const Interval(0, 1, curve: Curves.easeInOut)))
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

    _heightAnimation =
        tween.animate(CurvedAnimation(parent: _controller, curve: const Interval(0.5, 1, curve: Curves.easeInOut)));
    _colorAnimation =
        tween.animate(CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.45, curve: Curves.easeInOut)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
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
        painter: AnimatedMultiplePainter(
            widthAnimation: _widthAnimation, heightAnimation: _heightAnimation, colorAnimation: _colorAnimation),
      ),
    );
  }
}
