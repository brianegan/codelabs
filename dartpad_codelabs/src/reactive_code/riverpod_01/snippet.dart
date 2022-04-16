//ignore_for_file: unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:math' as math;
import 'package:flutter/material.dart';

//TODO[4]: Create a global provider to access CounterNotifier and its state

void main() {
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

//TODO[1]: Extend the class with a StateNotifier<int> and provide an initial count value of 0.
class CounterNotifier {

  void increment() {
    //TODO[2]: Increment the state here
  }

  void decrement() {
    //TODO[2]: Decrement the state here
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
            onPressed: () {},
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            backgroundColor: Colors.red,
            child: const Icon(Icons.exposure_plus_1),
            onPressed: () {},
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
