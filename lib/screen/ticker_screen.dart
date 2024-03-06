import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerScreen extends StatefulWidget {
  const TickerScreen({super.key});

  @override
  State<TickerScreen> createState() => _TickerScreenState();
}

class _TickerScreenState extends State<TickerScreen> {
  double angle = 0.0;
  Ticker? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker((elapsed) {
      setState(() {
        angle += 0.1;
      });
    });
  }

  /// アニメーションを開始する
  void _start() {
    _ticker?.start();
  }

  /// アニメーションを停止する
  void _stop() {
    _ticker?.stop();
  }

  @override
  void dispose() {
    _ticker?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TickerScreen'),
      ),
      body: Center(
        child: Transform.rotate(
          angle: angle,
          child: Container(width: 100, height: 100, color: Colors.blue),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_ticker?.isActive ?? false) {
            _stop();
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
