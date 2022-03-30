class CalculoPorcentagem {
  int questoes = 13;

  double percentual(int totaldeAcertos) {
    return totaldeAcertos * 100 / questoes;
  }
}
