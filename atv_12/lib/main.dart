import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tela1(),
    );
  }
}


