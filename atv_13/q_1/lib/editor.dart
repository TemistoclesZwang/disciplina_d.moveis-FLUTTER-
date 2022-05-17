import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditorTexto {
  // EditorTexto(String textoInput, int indexComando) {
  //   this._textoInput = textoInput;
  //   this._indexComando = indexComando;
  // }

  // get textoInput => textoInput;
  // get indexComando => indexComando;

  // set _indexComando(int _indexComando) {}
  // set _textoInput(String _textoInput) {}

  List SplitDotexto(String textoInput) {
    //split String textoInput
    return textoInput.split(' ');
  }

  TextStyle SeletorEstilo(int index) {
    bool negrito = false;
    bool italico = false;
    bool sublinhado = false;

    switch (index) {
      case 0:
        if (negrito == false) {
          negrito == true;
          return TextStyle(fontWeight: FontWeight.bold);
        } else {
          negrito == false;
          print(negrito);
          return TextStyle(color: Colors.black);
          
        }
      case 1:
        italico = true;
        return TextStyle(fontStyle: FontStyle.italic);
        break;
      case 2:
        sublinhado = true;
        return TextStyle(decoration: TextDecoration.underline);
        break;
      default:
        return TextStyle(color: Colors.black);
    }
  }

  // Italico(String textoInput, int indexComando) {
  //   if (indexComando == 0) {
  //       print('negrito');
  //     // return textoInput.replaceAll(
  //         // RegExp(r'\*\*(.*?)\*\*'), '<i>TESTANDO</i>');
  //         //.da pra usar esse comando HTML no dart ? O_O
  //   }
  // }
}
