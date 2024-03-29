import 'package:animation_sample/screen/animated_builder_screen.dart';
import 'package:animation_sample/screen/animated_widget_screen.dart';
import 'package:animation_sample/screen/animation_controller_screen.dart';
import 'package:animation_sample/screen/gravity_simulation_screen.dart';
import 'package:animation_sample/screen/implicitly_animated_widget_screen.dart';
import 'package:animation_sample/screen/scheduler_binding_screen.dart';
import 'package:animation_sample/screen/spring_simulation_screen.dart';
import 'package:animation_sample/screen/ticker_screen.dart';
import 'package:animation_sample/screen/animation_and_animatable_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('ShcedulerBindingScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ShcedulerBindingScreen()));
              },
            ),
            ListTile(
              title: const Text('TickerScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TickerScreen()));
              },
            ),
            ListTile(
              title: const Text('AnimationControllerScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AnimationControllerScreen()));
              },
            ),
            ListTile(
              title: const Text('AnimationAndAnimatableScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const AnimationAndAnimatableScreen()));
              },
            ),
            ListTile(
              title: const Text('AnimatedWidgetScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedWidgetScreen()));
              },
            ),
            ListTile(
              title: const Text('ImplicitylyAnimatedWidgetScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ImplicitylyAnimatedWidgetScreen()));
              },
            ),
            ListTile(
              title: const Text('AnimatedBuilderScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnimatedBuilderScreen()));
              },
            ),
            ListTile(
              title: const Text('GravitySimulationScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GravitySimulationScreen()));
              },
            ),
            ListTile(
              title: const Text('SpringSimulationScreen'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SpringSimulationScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
