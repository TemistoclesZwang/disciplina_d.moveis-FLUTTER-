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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n'
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
              style: const TextStyle(fontSize: 17),
            ),
            const SizedBox(height: 30),
            ListView(
              shrinkWrap: true,
              children: <Widget>[
                CheckboxListTile(
                  title: const Text('Aceito compartilhar dados para melhoria do aplicativo'),
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
                      'Aceito que meu login seja utilizado para fins de marketing'),
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
                  title: const Text('Autorizo o recebimento de mensagens SMS'),
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