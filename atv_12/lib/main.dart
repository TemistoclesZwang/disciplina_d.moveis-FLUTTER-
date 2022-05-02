import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';

import 'ProcurarCep.dart';
import 'RastrearPacote.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//!var e funcoes aqui
  Widget botaoDegrade(String textoBotao, var page) {
    const SizedBox(height: 30);
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              primary: Colors.white,
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            child: Text(textoBotao),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//!widgets aqui
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
        ),
            botaoDegrade('Procurar CEP',Tela1()),
            Padding(padding: EdgeInsets.all(20)),
            botaoDegrade('Rastrear pacote',RastrearPacote()),
      ],
    );
  }
}
