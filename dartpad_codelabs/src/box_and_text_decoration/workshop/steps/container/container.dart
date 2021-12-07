// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Before extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.blue),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.green),
          ),
        ),
      ),
    );
  }
}

class After extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: Colors.blue),
      child: DecoratedBox(
        decoration: BoxDecoration(color: Colors.green),
      ),
    );
  }
}
