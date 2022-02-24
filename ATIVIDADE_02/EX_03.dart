import 'EX_02.dart';
void main() {
  final listaNumeros = [2, 3, 4];
  funcaoExe(listaNumeros, somarLista);
}

void funcaoExe(List<int> arrayExemplo, int Function(List<int>) f) {
  return print(f(arrayExemplo));
}
