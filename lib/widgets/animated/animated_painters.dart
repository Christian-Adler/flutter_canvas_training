import 'package:flutter/material.dart';

import 'animated_arc.dart';
import 'animated_multiple.dart';

class AnimatedPainters extends StatefulWidget {
  const AnimatedPainters({Key? key}) : super(key: key);

  @override
  State<AnimatedPainters> createState() => _AnimatedPaintersState();
}

class _AnimatedPaintersState extends State<AnimatedPainters> {
  Widget widg = Container();

  void setWidget(Widget p) {
    setState(() {
      widg = p;
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
              ElevatedButton(onPressed: () => setWidget(const AnimatedArc()), child: const Text('Arc')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => setWidget(const AnimatedMultiple()), child: const Text('Multiple')),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: widg,
          ),
        ),
      ],
    );
  }
}
