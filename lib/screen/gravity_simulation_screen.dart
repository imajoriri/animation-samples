import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class GravitySimulationScreen extends StatefulWidget {
  const GravitySimulationScreen({super.key});

  @override
  State<GravitySimulationScreen> createState() =>
      _GravitySimulationScreenState();
}

class _GravitySimulationScreenState extends State<GravitySimulationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = controller.drive(Tween(begin: 0, end: 400));

    controller.addListener(() {
      setState(() {});
    });
  }

  void _start() {
    controller.animateWith(
      GravitySimulation(
        9.8, // acceleration - 重力加速度
        0.0, // distance - 開始位置
        300.0, // endDistance - 終了位置
        0.0, // velocity - 初速度
      ),
    );
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
        title: const Text('GravitySimulationScreen'),
      ),
      body: Stack(
        children: [
          Positioned(
            top: animation.value,
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
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
