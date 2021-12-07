// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Uniform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow()],
          color: Colors.blue,
        ),
      ),
    );
  }
}

class Individual extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.orange,
              offset: Offset(10, 20),
              blurRadius: 10,
              spreadRadius: 0,
            )
          ],
          color: Colors.blue,
        ),
      ),
    );
  }
}
