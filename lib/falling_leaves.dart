import 'dart:math';
import 'package:flutter/material.dart';

class FallingLeaves extends StatefulWidget {
  const FallingLeaves({super.key});

  @override
  State<FallingLeaves> createState() => _FallingLeavesState();
}

class _FallingLeavesState extends State<FallingLeaves>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Random _random = Random();

  late List<double> xPositions;
  late List<double> speeds;

  static const int leafCount = 15;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();

    xPositions =
        List.generate(leafCount, (_) => _random.nextDouble() * 400);
    speeds = List.generate(leafCount, (_) => 1 + _random.nextDouble() * 2);
  }
@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return IgnorePointer(
    child: AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Stack(
          children: List.generate(leafCount, (i) {
            final y =
                (_controller.value * size.height * speeds[i]) % size.height;
            final x =
                (xPositions[i] + _controller.value * 100 * speeds[i]) %
                    size.width;

            return Positioned(
              top: y,
              left: x,
              child: Transform.rotate(
                angle: y / 20,
                child: const Icon(
                  Icons.star,
                  color: Colors.amberAccent,
                  size: 20,
                ),
              ),
            );
          }),
        );
      },
    ),
  );
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
