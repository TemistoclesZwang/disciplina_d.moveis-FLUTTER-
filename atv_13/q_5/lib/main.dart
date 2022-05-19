import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ZOOM app'),
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
  double _zoom = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Transform.scale(
                scale: _zoom / 100,
                child: Image.asset('assets/ely.jpg'),
              ),
              //change scale
            Slider(
              value: _zoom,
              min: 100,
              max: 500,
              onChanged: (double value) {
                setState(() {
                  _zoom = value;
                });
              },
            ),

            // Image.asset('assets/ely.jpg',
            //   width: _zoom,
            //   height: _zoom,
            // ),
            // SizedBox(
            //   height: 80,
            // ),
            // Slider(
            //   value: _zoom,
            //   min: 0.0,
            //   max: 500,
            //   onChanged: (double value) {
            //     setState(() {
            //       _zoom = value;
            //     });
            //   },
            // ),

            
          ],
          
        ),
      ),

    );
  }
}
