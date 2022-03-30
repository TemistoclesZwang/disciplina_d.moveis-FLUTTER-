import 'dart:async';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class persistirDados {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveData(int dados) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt('dados', dados);
  }

  Future<int> readData() async {
    final SharedPreferences prefs = await _prefs;
    int dadosPersistidos = prefs.getInt('dados') ?? 0;
    print('readData: $dadosPersistidos');
    return dadosPersistidos;
  }
}
// Obtain shared preferences.

