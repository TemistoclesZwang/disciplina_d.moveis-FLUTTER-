// Declare e inicialize 3 variáveis: o dia
// de hoje, o mês e o ano e imprima a
// data na tela no formato
// “dia/mês/ano”. Use o operador $
// para interpolar as variáveis na string.

import 'dart:io';

void main() {

  // entradaDados
  stdout.write('insira o dia:');
  String? diaString = stdin.readLineSync();

  stdout.write('insira o mês:');
  String? mesString = stdin.readLineSync();

  stdout.write('insira o ano:');
  String? anoString = stdin.readLineSync();

  //parse devido ao stdout pegar String
  if (diaString != null && mesString != null && anoString != null) {
    int dia = int.parse(diaString);
    int mes = int.parse(mesString);
    int ano = int.parse(anoString);
  
    print("\nResultado: $dia/$mes/$ano");
  }

}
