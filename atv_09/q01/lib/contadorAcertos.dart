class ContadorAcertos {
  int acertos = 0;

  acerto() {
    acertos += 1;
  }

  erro() {
    acertos -= 1;

  }

  totalAcertos() {
    return acertos;
  }

    resetAcertos() {
    acertos = 0;
  }
}
