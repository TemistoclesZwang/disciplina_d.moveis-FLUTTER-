import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dados'),
          backgroundColor: Colors.red,
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

class _PaginaDosDadosState extends State<PaginaDosDados> {
  int numeroEsquerda = 1;
  int numeroDireita = 1;

  void gerarValoresAleatorios() {
    setState(() {
      numeroEsquerda = Random().nextInt(6) + 1;
      numeroDireita = Random().nextInt(6) + 1;
    });
  }
  // .Testando um valor para cada lado
    void gerarValorEsquerda() {
    setState(() {
      numeroEsquerda = Random().nextInt(6) + 1;
    });
  }
    void gerarValorDireita() {
    setState(() {
      numeroDireita = Random().nextInt(6) + 1;
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
                gerarValorEsquerda();
                // gerarValoresAleatorios();
              },
              child: Image.asset('images/dice$numeroEsquerda.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                gerarValorDireita();
                // gerarValoresAleatorios();
              },
              child: Image.asset('images/dice$numeroDireita.png'),
            ),
          ),
        ],
      ),
    );
  }
}
