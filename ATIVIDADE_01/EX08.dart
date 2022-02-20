// Utilizando o método forEach de
// listas, imprima o dobro dos números
// de uma lista de inteiros.

void main() {
  dobro();
}

void dobro() {
  final lista = [1, 2, 3];
  lista.forEach((numero) {
    int dobrar = numero * 2;
    print(dobrar);
  });
}