import 'package:flutter/material.dart';

import 'widgets/animated/animated_painters.dart';
import 'widgets/simple_painters.dart';

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
  Widget widg = Container();

  void setWidget(Widget p) {
    setState(() {
      widg = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      decoration: const BoxDecoration(
        gradient: SweepGradient(
          center: FractionalOffset.center,
          colors: <Color>[
            Color(0xFF4285F4), // blue
            Color(0xFF34A853), // green
            Color(0xFFFBBC05), // yellow
            Color(0xFFEA4335), // red
            Color(0xFF4285F4), // blue again to seamlessly transition to the start
          ],
          stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () => setWidget(const SimplePainters()), child: const Text('Simple Painters')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () => setWidget(const AnimatedPainters()), child: const Text('Animated Painters')),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SizedBox(
              // Groeße: Wichtig, damit im Painter Size korrekt geht. Sonst width & height = 0
              width: double.infinity,
              height: double.infinity,
              child: widg,
            ),
          ),
        ],
      ),
    );
  }
}
