import 'package:flutter/material.dart';

class ImplicitylyAnimatedWidgetScreen extends StatefulWidget {
  const ImplicitylyAnimatedWidgetScreen({super.key});

  @override
  State<ImplicitylyAnimatedWidgetScreen> createState() =>
      _ImplicitylyAnimatedWidgetScreenState();
}

class _ImplicitylyAnimatedWidgetScreenState
    extends State<ImplicitylyAnimatedWidgetScreen> {
  Alignment alignment = Alignment.centerLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ImplicitylyAnimatedWidgetScreen'),
      ),
      body: AnimatedAlign(
        alignment: alignment,
        duration: const Duration(seconds: 2),
        curve: Curves.easeOutExpo,
        child: Container(width: 100, height: 100, color: Colors.blue),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (alignment == Alignment.centerLeft) {
            setState(() {
              alignment = Alignment.centerRight;
            });
          } else {
            setState(() {
              alignment = Alignment.centerLeft;
            });
          }
        },
        tooltip: 'Play Animation',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
