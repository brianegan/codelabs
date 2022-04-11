import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Flutter Dart Workshop',
      home: const CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;
  late final StreamController _streamController;
  late final Stream _stream;

  @override
  void initState() {
    _streamController = StreamController();
    _stream = _streamController.stream;
    super.initState();
  }

  void increment() {
    _streamController.sink.add(_count++);
  }

  void decrement() {
    _streamController.sink.add(_count--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive code with Streams!'),
      ),
      body: Center(
        child: Container(
          color:
          Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
          child: Column(
            children: [
              CounterText(
                stream: _stream,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.grey,
            child: const Icon(Icons.exposure_minus_1),
            onPressed: decrement,
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.exposure_plus_1),
            onPressed: increment,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}

class CounterText extends StatelessWidget {
  final Stream stream;

  const CounterText({Key? key, required this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(48),
          color:
          Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
          child: Text(
            snapshot.data != null ? snapshot.data.toString() : "0",
            textAlign: TextAlign.center,
          ),
        );
      },
      stream: stream,
    );
  }
}
