import 'package:flutter/material.dart';

class TweenScreen extends StatefulWidget {
  const TweenScreen({super.key});

  @override
  State<TweenScreen> createState() => _TweenScreenState();
}

class _TweenScreenState extends State<TweenScreen>
    with SingleTickerProviderStateMixin {
  double angle = 0.0;
  late final AnimationController controller;
  late final Animatable<Alignment> tween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    tween =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .chain(CurveTween(curve: Curves.easeOutExpo));

    controller.addListener(() {
      setState(() {});
    });
  }

  /// アニメーションを開始する
  void _start() {
    controller.forward();
  }

  /// アニメーションを逆生成する
  void _reverse() {
    controller.reverse();
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
        title: const Text('TweenScreen'),
      ),
      body: Container(
        alignment: tween.evaluate(controller),
        child: Container(width: 100, height: 100, color: Colors.blue),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            _reverse();
          } else {
            _start();
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
