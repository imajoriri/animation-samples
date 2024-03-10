import 'package:flutter/material.dart';

class AnimatedBuilderScreen extends StatefulWidget {
  const AnimatedBuilderScreen({super.key});

  @override
  State<AnimatedBuilderScreen> createState() => _AnimatedBuilderScreenState();
}

class _AnimatedBuilderScreenState extends State<AnimatedBuilderScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<AlignmentGeometry> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // AlignmentTweenを直接AnimationControllerにchainする
    animation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).chain(CurveTween(curve: Curves.easeOutExpo)).animate(controller);
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
        title: const Text('AnimatedBuilderScreen'),
      ),
      body: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Align(
            alignment: animation.value,
            child: child,
          );
        },
        child: Container(
            width: 100,
            height: 100,
            color: Colors.blue), // This is the fixed child
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            _reverse();
          } else {
            _start();
          }
        },
        tooltip: 'Play Animation',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
