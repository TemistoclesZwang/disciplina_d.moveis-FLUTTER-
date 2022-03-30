class ContadorAcertos {
  int acertos = 0;

  acerto() {
    acertos += 1;
    print(acertos);
  }
  
  duvida() {
    acertos += 0;
    print(acertos);
  }

  erro() {
    acertos -= 0; //!
    print(acertos);
  }

  totalAcertos() {
    return acertos;
  }

  resetAcertos() {
    acertos = 0;
  }
}
