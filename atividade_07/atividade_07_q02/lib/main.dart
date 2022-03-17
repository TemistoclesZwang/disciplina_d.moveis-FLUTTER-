import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 200, 220, 255),
        appBar: AppBar(
          title: Text('Incrementador de números'),
          backgroundColor: Color.fromARGB(255, 0, 19, 83),
        ),
        body: NumberPage(),
      ),
    ),
  );
}

class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  int numero = 0;

  void incrementar() {
    setState(() {
      numero += 1;
    });
  }

  void decrementar() {
    setState(() {
      if (numero > 0) {
        numero -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Text(
              '$numero',
              style: TextStyle(fontSize: 70),
            ),
          ]),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  incrementar();
                },
                child: Text('+'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  decrementar();
                },
                child: Text('-'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
