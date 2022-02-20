// Elabore um script que faça um for de 
// 1 até um valor e imprima uma 
// sequência semelhante à abaixo. 
// Use qualquer estrutura de repetição 
// .1 
// ··2 
// ...3


import 'dart:io';

void main() {
  // entradaDados
  stdout.write('insira o valor limite: ');
  String? valorString = stdin.readLineSync();

  //parse devido ao stdout pegar String
  if (valorString != null ) {
    int valor = int.parse(valorString);
    estrutura(valor);
  }
}

void estrutura(valor){
  for (int i = 1; i <= valor; i++) {
      String pontos = '.' * i;
      print('$pontos$i');
    }
  }
