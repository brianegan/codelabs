// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DirectionalitySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Text(
        'This is a bit of text!',
      ),
    );
  }
}

class MaterialAppSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.black,
      locale: Locale('en'),
      home: Text(
        'This is a bit of text!',
      ),
    );
  }
}
