//ignore_for_file: unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>(
  (ref) => CounterNotifier(),
);

void main() {
  //TODO[4]: Wrap the root widget with ProviderScope()
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Flutter Dart Workshop',
      home: CounterPage(),
    );
  }
}

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0);

  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }
}

class CounterPage extends StatefulWidget {
  CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive code with Riverpod!'),
      ),
      body: Center(
        child: Container(
          color:
              Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
          child: Column(
            children: [
              CounterText(
                count: 0,
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
            onPressed: () {
              //TODO[2]: Trigger the CounterNotifier.increment() from onPressed()
            },
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () {
              //TODO[3]: Trigger the CounterNotifier.decrement() from onPressed()
            },
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  final int count;

  const CounterText({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //TODO[1]: Convert this widget to ConsumerWidget and watch the counterProvider here
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(48),
        color: Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
        child: Text(
          count.toString(),
          textAlign: TextAlign.center,
        ));
  }
}
