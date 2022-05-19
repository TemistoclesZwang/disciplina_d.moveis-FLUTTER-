import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditorTexto {
  TextStyle SeletorEstilo(int index, List<bool> ativarDesativarSeletores) {

    TextStyle estilos = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
    );

    if (index == 0 && ativarDesativarSeletores[index] == true) {
      estilos = TextStyle(fontWeight:null);

    } else if (index == 1 && ativarDesativarSeletores[index] == true) {
      estilos = TextStyle(fontStyle: null);
      
    } else if (index == 2 && ativarDesativarSeletores[index] == true) {
      estilos = TextStyle(decoration: null);
    }
    return estilos;
  }
}
// estilos = TextStyle(fontWeight:FontWeight.bold).merge(estilos);
