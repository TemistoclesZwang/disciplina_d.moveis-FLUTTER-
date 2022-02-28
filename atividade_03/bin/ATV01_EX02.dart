// Declare e inicialize 3 variáveis: o dia
// de hoje, o mês e o ano e imprima a
// data na tela no formato
// “dia/mês/ano”. Use o operador $
// para interpolar as variáveis na string.

import 'dart:io';

void main() {
  // entradaDados
  int dia = DateTime.now().day;
  int mes = DateTime.now().month;
  int ano = DateTime.now().year;
  
  pegarDiaMesAno(dia, mes, ano);
}

String pegarDiaMesAno(int dia, int mes, int ano) {
  return "$dia/$mes/$ano";
}
