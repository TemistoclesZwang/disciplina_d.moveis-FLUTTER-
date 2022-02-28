// 1. Crie uma função que receba um array e retorne a soma de todos os elementos.

import 'package:test/test.dart';

void main() {
  test('lista de numeros', () {
    final lista = [1, 2, 3];
    print(somarLista(lista));
    expect (lista,isList);
  });
  test('Soma', () {
    expect(somarLista([1, 2, 3]), 6);
  });

  test('Lista vazia', () {
    expect(somarLista([]), isZero);
    // !slide
  });

  test('throw erro', () {
    expect(somarLista([1]), throwsArgumentError);
    // ! slide
  }, skip:'Não implementado'); //!slide
}

int somarLista(List<int> lista) {
    int acumulador = 0;
    lista.forEach((numero) {
    acumulador += numero;
    });
  return acumulador;
}
