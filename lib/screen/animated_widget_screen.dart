import 'package:flutter/material.dart';

class AnimatedWidgetScreen extends StatefulWidget {
  const AnimatedWidgetScreen({super.key});

  @override
  State<AnimatedWidgetScreen> createState() => _AnimatedWidgetScreenState();
}

class _AnimatedWidgetScreenState extends State<AnimatedWidgetScreen>
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
    // animation = animatable.animate(controller);
    animation = controller.drive(animatable);

    // addListnerする必要ない。
    // controller.addListener(() {
    //   setState(() {});
    // });
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
        title: const Text('AnimatedWidgetScreen'),
      ),
      body: AlignTransition(
        alignment: animation,
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
