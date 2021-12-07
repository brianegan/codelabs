// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DecorationImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.orange,
          width: 20,
        ),
        gradient: LinearGradient(
          colors: [Colors.white, Colors.lightBlue],
        ),
      ),
    );
  }
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(Size(100, 100)),
      child: Image.network(
        'https://dartpad-workshops-io2021.web.app/example_flutter/images/dash.png',
        width: 100,
        height: 100,
      ),
    );
  }
}
