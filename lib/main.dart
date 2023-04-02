import 'package:flutter/material.dart';
import 'package:flutter_canvas_training/painter/arc_prainter.dart';
import 'package:flutter_canvas_training/painter/basic_shapes_prainter.dart';

import 'painter/cubic_bezier_curves_painter.dart';
import 'painter/quadratic_bezier_curves_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Canvas Training',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const Scaffold(
        body: SafeArea(child: RootContainer()),
      ),
    );
  }
}

class RootContainer extends StatefulWidget {
  const RootContainer({super.key});

  @override
  State<RootContainer> createState() => _RootContainerState();
}

class _RootContainerState extends State<RootContainer> {
  CustomPainter painter = BasicShapesPainter();

  void setPainter(CustomPainter p) {
    setState(() {
      painter = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            color: Theme.of(context).colorScheme.onPrimary,
            child: SingleChildScrollView(
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
                ],
              ),
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
      ),
    );
  }
}
