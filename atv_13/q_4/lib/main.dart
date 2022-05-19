import 'package:flutter/cupertino.dart';
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
      backgroundColor: _lights ? Color.fromARGB(255, 255, 244, 224) :
        Color.fromARGB(255, 82, 129, 200),
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
            ),
            SizedBox(
              height: 80,
            ),
            CupertinoSwitch(
              value: _lights,
              onChanged: (bool value) {
                setState(() {
                  _lights = value;
                });
              },
            ),
            SwitchListTile(
              tileColor:  _lights ? Color.fromARGB(255, 250, 229, 191) :
                Color.fromARGB(255, 65, 120, 203),
                title: const Text('Android'),
                value: _lights,
                onChanged: (bool value) {
                  setState(() {
                    _lights = value;
                  });
                }),
                Switch.adaptive(
                  splashRadius: 50,
                  activeThumbImage: AssetImage('assets/2.png'),
                  activeTrackColor: Colors.blue,
                  inactiveThumbImage: AssetImage('assets/1.png'),
                  inactiveTrackColor: Colors.grey,
                  value: _lights,
                  onChanged: (bool value) {
                    setState(() {
                      _lights = value;
                    });
                  },
                  )
          ],
        ),
      ),
    );
  }
}
