import 'package:flutter/material.dart';
import 'package:flutter_canvas_training/painter/basic_shapes_prainter.dart';

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

class RootContainer extends StatelessWidget {
  const RootContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        // Groeße: Wichtig, damit im Painter Size korrekt geht. Sonst width & height = 0
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: BasicShapesPainter(),
        ),
      ),
    );
  }
}
