import 'package:flutter/material.dart';
import 'package:flutter_canvas_training/util/Util.dart';

import '../painter/arc_painter.dart';
import '../painter/basic_shapes_painter.dart';
import '../painter/blur_painter.dart';
import '../painter/color_filter_painter.dart';
import '../painter/cubic_bezier_curves_painter.dart';
import '../painter/hit_test_painter.dart';
import '../painter/linear_gradient_painter.dart';
import '../painter/quadratic_bezier_curves_painter.dart';
import '../painter/radial_gradient_painter.dart';
import '../painter/should_repaint_painter.dart';
import '../painter/sweep_gradient_painter.dart';

class SimplePainters extends StatefulWidget {
  const SimplePainters({Key? key}) : super(key: key);

  @override
  State<SimplePainters> createState() => _SimplePaintersState();
}

class _SimplePaintersState extends State<SimplePainters> {
  CustomPainter painter = BasicShapesPainter();

  void setPainter(CustomPainter p) {
    setState(() {
      painter = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ElevatedButton(onPressed: () => setPainter(BasicShapesPainter()), child: const Text('Basic Shape')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(ArcPainter()), child: const Text('Arc')),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () => setPainter(QuadraticBezierCurvesPainter()),
                  child: const Text('QuadraticBezierCurves')),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () => setPainter(CubicBezierCurvesPainter()), child: const Text('CubicBezierCurves')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(RadialGradientPainter()), child: const Text('RadialGradient')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(SweepGradientPainter()), child: const Text('SweepGradient')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(LinearGradientPainter()), child: const Text('LinearGradient')),
              const SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () => setPainter(ShouldRepaintPainter(Util.nextDouble(0, 360))),
                  // onPressed: () => setPainter(ShouldRepaintPainter(50)),
                  child: const Text('ShouldRepaint')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(HitTestPainter()), child: const Text('HitTest')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(BlurPainter()), child: const Text('Blur')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setPainter(ColorFilterPainter()), child: const Text('ColorFilter')),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            color: Colors.white,
            // Groeße: Wichtig, damit im Painter Size korrekt geht. Sonst width & height = 0
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: painter,
            ),
          ),
        ),
      ],
    );
  }
}
