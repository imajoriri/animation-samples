import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// SchedulerBindingのサンプル用のスクリーン
///
/// FABを押すとアニメーションが開始・停止される
class ShcedulerBindingScreen extends StatefulWidget {
  const ShcedulerBindingScreen({super.key});

  @override
  State<ShcedulerBindingScreen> createState() => _ShcedulerBindingScreenState();
}

class _ShcedulerBindingScreenState extends State<ShcedulerBindingScreen> {
  double angle = 0.0; // アニメーションするプロパティ
  int? animationId;

  void _repeat() {
    animationId = SchedulerBinding.instance.scheduleFrameCallback(
      (timeStamp) {
        setState(() {
          angle += 0.1;
        });
        _repeat();
      },
      rescheduling: true,
    );
  }

  /// アニメーションを開始する
  void _start() {
    animationId = SchedulerBinding.instance.scheduleFrameCallback(
      (timeStamp) {
        _repeat();
      },
    );
  }

  /// アニメーションを停止する
  void _stop() {
    if (animationId != null) {
      SchedulerBinding.instance.cancelFrameCallbackWithId(animationId!);
      animationId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ShcedulerBindingScreen'),
      ),
      body: Center(
        child: Transform.rotate(
          angle: angle,
          child: Container(width: 100, height: 100, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (animationId == null) {
            _start();
          } else {
            _stop();
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
