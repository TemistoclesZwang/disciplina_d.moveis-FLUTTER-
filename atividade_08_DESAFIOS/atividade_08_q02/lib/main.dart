import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 142, 162, 170),
        appBar: AppBar(
          title: Text('Dados'),
          backgroundColor: Color.fromARGB(255, 54, 158, 244),
        ),
        body: PaginaDosDados(),
      ),
    ),
  );
}

class PaginaDosDados extends StatefulWidget {
  @override
  _PaginaDosDadosState createState() => _PaginaDosDadosState();
}

  int randomicos(){
  return Random().nextInt(8) + 1;
}

class _PaginaDosDadosState extends State<PaginaDosDados> {

  int numeroEsquerda = 1;
  int numeroDireita = 1;

  void gerarValoresAleatorios() {

    int left = randomicos();
    int right = randomicos();

    while(left == right) {
      left = randomicos();
    }

    setState(() {
      numeroEsquerda = left;
      numeroDireita = right;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                gerarValoresAleatorios();
              },
              child: Image.asset('images/octaedro$numeroEsquerda.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                gerarValoresAleatorios();
              },
              child: Image.asset('images/octaedro$numeroDireita.png'),
            ),
          ),
        ],
      ),
    );
  }
}
