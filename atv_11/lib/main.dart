import 'dart:convert' as convert;
import 'dart:convert';
import 'package:atv_11/tela1backup.dart';
import 'package:flutter/material.dart';

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


