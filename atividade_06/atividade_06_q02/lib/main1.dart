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
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildContainer('Container 1', Colors.red),
              buildContainer('Container 2', Colors.blue),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  buildContainerCenter('Container 3', Colors.yellow),
                  buildContainerCenter('Container 4', Colors.green),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(String text, Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Text(text),
    );
  }

  Container buildContainerCenter(String text, Color color) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      child: Text(text),
    );
  }
}