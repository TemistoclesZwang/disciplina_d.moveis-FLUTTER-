// 1. Crie uma função que receba um array e retorne a soma de todos os elementos.

void main() {
  final lista = [1, 2, 3];
  print(somarLista(lista));
}

int somarLista(List<int> lista) {
    int acumulador = 0;
    lista.forEach((numero) {
    acumulador += numero;
    });
  return acumulador;
}
