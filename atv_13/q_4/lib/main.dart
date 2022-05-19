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
  bool _lights = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lights ? Color.fromARGB(255, 255, 244, 224) : Color.fromARGB(255, 82, 129, 200),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              _lights
                  ? 'assets/2.png'
                  : 'assets/1.png',
              // width: 500,
              // height: 500,
            ),
            SizedBox(
              height: 80,
            ),
            SwitchListTile(
                title: const Text('Interruptor'),
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
