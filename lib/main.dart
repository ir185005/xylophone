import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xylophone'),
      ),
      body: Column(
        children: const [
          Tap(color: Colors.red, tapNumber: 1),
          Tap(color: Colors.green, tapNumber: 2),
          Tap(color: Colors.blue, tapNumber: 3),
        ],
      ),
    );
  }
}

class Tap extends StatelessWidget {
  const Tap({Key? key, required this.color, required this.tapNumber})
      : super(key: key);

  final Color color;
  final int tapNumber;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          final player = AudioCache();
          player.play('note$tapNumber.wav');
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
