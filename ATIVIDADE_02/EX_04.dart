// Crie duas versões de uma função que eleva um número (base) a outro (expoente):
// a primeira versão é a tradicional, já a segunda deve ser uma arrow function.

import 'dart:math';

void main(List<String> args) {
  potenciaNormal(10, 3);
  potenciaArrow(2, 10);
}

int potenciaNormal(int a, int b) {
  int resultado = 0;

  for (int i = 0; i < b; i++) {
    if (i == 0) {
      resultado = a;
    } else {
      resultado = resultado * a;
    }
  }
  print(resultado);
  return resultado;
}

num potenciaArrow(int a, int b) => potenciaNormal(a, b);
