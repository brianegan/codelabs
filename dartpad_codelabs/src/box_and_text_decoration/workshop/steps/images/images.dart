// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class DecorationImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://dartpad-workshops-io2021.web.app/example_flutter/images/dash.png',
          ),
          fit: BoxFit.cover,
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
