import 'package:flutter/material.dart';
import 'package:q_3/checkbox_logic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//!var func
  bool pressionado = false;
  CheckboxLogic checkboxLogic = CheckboxLogic();
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget'+ 'consectetur tempor, nisl nunc egestas nisi, eu porttitor nisl nunc euismod nunc.'+ 'Doneceuismod, nisl eget consectetur tempor, nisl nunc egestas nisi, eu porttitornisl'+ 'nunc euismod nunc. Donec euismod, nisl eget consectetur tempor, nisl nunc egestas', 
              style: const TextStyle(fontSize: 17),
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                CheckboxListTile(
                  title: const Text('Aceita doar seus dados pro Zuqberg ?'),
                  value: checkboxLogic.b1,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxLogic.b1 = value!;
                      checkboxLogic.tresPrimeiros();
                    });
                  },
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                CheckboxListTile(
                  title: const Text(
                      'Aceita ser espionado pelo microfone do celular?'),
                  value: checkboxLogic.b2,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxLogic.b2 = value!;
                      checkboxLogic.tresPrimeiros();
                    });
                  },
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                CheckboxListTile(
                  title: const Text('Aceita doar suas mensagens de texto ?'),
                  value: checkboxLogic.b3,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxLogic.b3 = value!;
                      checkboxLogic.tresPrimeiros();
                    });
                  },
                ),
              ],
            ),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                CheckboxListTile(
                  title: const Text('Aceito todos os itens acima, eu confio no Zuqberg'),
                  value: checkboxLogic.b4,
                  onChanged: (bool? value) {
                    setState(() {
                      checkboxLogic.b4 = value!;
                      checkboxLogic.aceitarTodos();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//!falta tristate parcilamente marcado