// 2. Crie  uma  função  que  receba  um  array  e  retorne  a  multiplicação  de  todos  os
// elementos;

void main() {
  final lista = [2,3,4];
  print(somarLista(lista));
}

int somarLista(List<int> lista) {
  int resultado = 0;
  for (int i = 0; i < lista.length; i++) {
    if (i == 0) {
      resultado = lista[i];
    } else {
      resultado = resultado * lista[i];
    }
  };
  return resultado;
}
