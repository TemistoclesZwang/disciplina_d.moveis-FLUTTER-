// Utilizando o método forEach de
// listas, imprima o dobro dos números
// de uma lista de inteiros.

import 'dart:io';

void main() {
  // entradaDados
  dobro();
}

String dobro() {
  final lista = [1, 2, 3, 4, 5];
  String saida = "";
  lista.forEach((numero) {
    saida += (numero * 2).toString() + " ";
  });
  return saida;
}
1