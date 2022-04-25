import 'package:flutter/material.dart';
import 'package:atv_11/tela1backup.dart';
import 'others/News.dart';

class tela2 extends StatelessWidget {
  String? noticiaClicada;

  tela2(this.noticiaClicada, {News? news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second screen"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Notícia:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$noticiaClicada',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
