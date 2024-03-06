import 'package:flutter/material.dart';

class AnimationAndAnimatableScreen extends StatefulWidget {
  const AnimationAndAnimatableScreen({super.key});

  @override
  State<AnimationAndAnimatableScreen> createState() =>
      _AnimationAndAnimatableScreenState();
}

class _AnimationAndAnimatableScreenState
    extends State<AnimationAndAnimatableScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animatable<AlignmentGeometry> animatable;
  late final Animation<AlignmentGeometry> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animatable =
        AlignmentTween(begin: Alignment.centerLeft, end: Alignment.centerRight)
            .chain(CurveTween(curve: Curves.easeOutExpo));
    animation = animatable.animate(controller);

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
      body: Align(
        alignment: animation.value,
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
