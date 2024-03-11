import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringSimulationScreen extends StatefulWidget {
  const SpringSimulationScreen({super.key});

  @override
  State<SpringSimulationScreen> createState() => _SpringSimulationScreenState();
}

class _SpringSimulationScreenState extends State<SpringSimulationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController.unbounded(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    controller.addListener(() {
      setState(() {});
    });
  }

  void _start() {
    controller.animateWith(SpringSimulation(
      const SpringDescription(
        mass: 1.0,
        stiffness: 100.0,
        damping: 10,
      ),
      0.0,
      300.0,
      10,
    ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('SpringSimulationScreen'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: controller.value,
            left: 100,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _start,
        tooltip: 'Play Animation',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
