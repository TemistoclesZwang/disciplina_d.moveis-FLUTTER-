import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // stretch
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildContainer('Container 1', Colors.white),
              buildContainer('Container 2', Colors.red),
              buildContainer('Container 3', Colors.blue),
              Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              buildContainer('Container 1', Colors.white),
              buildContainer('Container 2', Colors.red),
              buildContainer('Container 3', Colors.blue),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(String text, Color color) {
    return Container(
      margin: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      width: 100,
      height: 100,
      color: color,
      child: Text(text),
    );
  }
}
