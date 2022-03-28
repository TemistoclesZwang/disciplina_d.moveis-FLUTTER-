import 'dart:math';

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 200, 220, 255),
        appBar: AppBar(
          title: Text('Advinhador de números'),
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

int gerarNumeroAleatorio(int limite) {
  return Random().nextInt(limite) + 1;
}

int valorParaAdvinhar = gerarNumeroAleatorio(100);

// ] as int;

class _NumberPageState extends State<NumberPage> {
  int numero = 0;

  String checarPalpite(int palpite) {
    print(palpite);
    if (palpite == valorParaAdvinhar) {
      // print('Você advinhou!');
      return 'Você advinhou!';
    } else if (palpite < valorParaAdvinhar) {
      // print('O número é maior');
      return 'O número é maior';
    } else {
      // print('O número é menor');
      return 'O número é menor';
    }
  }
  int _currentValue = 50;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              NumberPicker(
          value: _currentValue,
          minValue: 0,
          maxValue: 100,
          onChanged: (value) => setState(() => _currentValue = value),
        ),
        Text('Current value: $_currentValue'),
              ],
            ),
            Text(
              checarPalpite(_currentValue),
              style: TextStyle(fontSize: 20),
            ),
          ]),
        ],
      ),
    );
  }
}
