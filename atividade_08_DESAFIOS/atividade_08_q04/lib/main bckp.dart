import 'dart:math';

import 'package:flutter/material.dart';

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

class _NumberPageState extends State<NumberPage> {

  int numero = 0;
  int palpite = Random().nextInt(3) + 1;

  String checarPalpite(int numero) {
    print(palpite);
    if (palpite == numero) {
      // print('Você advinhou!');
      return 'Você advinhou!';
    } else if (palpite > numero) {
      // print('O número é maior');
      return 'O número é maior';
    } else {
      // print('O número é menor');
      return 'O número é menor';
    }
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    decrementar();
                  },
                  child: Text('-'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    incrementar();
                  },
                  child: Text('+'),
                ),
              ],
            ),
            Text(
              '$numero',
              style: TextStyle(fontSize: 70),
            ),
              Text(
              checarPalpite(numero),
              style: TextStyle(fontSize: 20),
            ),
          ]),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
