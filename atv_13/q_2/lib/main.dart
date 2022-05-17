import 'package:flutter/material.dart';

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
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Campo 1',
              ),
              onEditingComplete:
                () => FocusScope.of(context).nextFocus(),
            ),
            // TextButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.add),
            //   label: const Text('Adicionar'),

            //   ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Campo 2',
              ),
              onEditingComplete:
                () => FocusScope.of(context).nextFocus(),
            ),
                        TextFormField(
              decoration: const InputDecoration(
                labelText: 'Campo 3',
              ),
              onEditingComplete:
                () => FocusScope.of(context).nextFocus(),
            ),
          ],
        ),
      ),
    );
  }
}
