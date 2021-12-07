// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'This is a bit of text!',
      // Remove the textDirection and run the sample. It breaks!
      // Then, add an explicit or implicit Directionality Widget.
      textDirection: TextDirection.ltr,
    );
  }
}
