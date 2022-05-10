import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class persistirDados {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveData(bool linkImg) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('linkImg', linkImg);
  }

  Future<bool> readData() async {
    final SharedPreferences prefs = await _prefs;
    bool dadosPersistidos = prefs.getBool('linkImg') ?? false;
    print('readData: $dadosPersistidos');
    return dadosPersistidos;
  }
}
// Obtain shared preferences.

