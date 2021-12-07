import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box Decoration',
      home: Padding(
        padding: const EdgeInsets.all(60),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red, Colors.blue],
            ),
          ),
        ),
      ),
    );
  }
}

class Examples extends StatelessWidget {
  const Examples({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Box & Text Decoration Solutions'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Container Gradient'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ContainerGradient();
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ContainerGradient extends StatelessWidget {
  const ContainerGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100,
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.blue,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.red, Colors.blue],
          ),
        ),
      ),
    );
  }
}
