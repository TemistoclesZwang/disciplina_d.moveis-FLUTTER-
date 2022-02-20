// Declare dois números n1 e n2 e inicialize-os. Realize as operações abaixo e exiba
// o resultado de cada uma:

import 'dart:io';

void main() {
  // entradaDados
  stdout.write('insira n1: ');
  String? n1String = stdin.readLineSync();

  stdout.write('insira n2: ');
  String? n2String = stdin.readLineSync();
  
  //parse devido ao stdout pegar String
  if (n1String != null && n2String != null) {
    int n1 = int.parse(n1String);
    int n2 = int.parse(n2String);
  
    //variaveis,processamento
    double questaoA = resto(n1, n2);
    int questaoB = inteira(n1, n2);
    int questaoC = elevado(n1, n2);
    bool questaoD = seInt(n1);
    bool questaoE = seNaoInt(n1);

      // saidaDados
    print(' a. O resto da divisão de n1 por n2:\n $questaoA \n');

    print(' b. n1 dividido por n2 com divisão inteira (operador: ~/):\n $questaoB \n');

    print(' c. n1 elevado a n2:\n $questaoC \n');

    print(' d. teste se n1 é inteiro (operador is):\n $questaoD \n');

    print(' e. teste se n1 não é inteiro (operador is!):\n $questaoE \n');

  }
}


double resto(n1, n2) {
  double restoDaDivisao = n1 / n2;
  return restoDaDivisao;
}

int inteira(n1, n2) {
  int divisaoInteira = n1 ~/ n2;
  return divisaoInteira;
}

int elevado(n1, n2) {
  int elevado = n1 ^ n2;
  return elevado;
}

bool seNaoInt(n1) {
  bool naoInt = n1 is! int;
  return naoInt;
}

bool seInt(n1) {
  bool seInt = n1 is int;
  return seInt;
}
