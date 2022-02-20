// Declare 3 variáveis numéricas,
// calcule a média aritmética e exiba:
// a. “aprovado”:  se  a  nota  for
// maior ou igual a 7;
// b.  “reprovado”:  se  for  menor
// que 4;
// c.  “exame final”:  se  estiver
// entre 4 e 7.

import 'dart:io';

void main() {
  // entradaDados
  stdout.write('insira a nota 1: ');
  String? nota1String = stdin.readLineSync();

  stdout.write('insira a nota 2: ');
  String? nota2String = stdin.readLineSync();

  stdout.write('insira a nota 2: ');
  String? nota3String = stdin.readLineSync();

  //parse devido ao stdout pegar String
  if (nota1String != null && nota2String != null && nota3String != null) {
    int nota1 = int.parse(nota1String);
    int nota2 = int.parse(nota2String);
    int nota3 = int.parse(nota3String);

    String calcular = calc(nota1, nota2, nota3);
    print('\nResultado: $calcular');
  }
}

String calc (n1, n2, n3) {
  int soma = n1 + n2 + n3;
  if ((soma) / 3 >= 7) {
    return 'aprovado';
  } else if ((soma) / 3 < 4) {
    return 'reprovado';
  } else if ((soma) / 3 >= 4 && (soma) / 3 <= 7) {
    return 'exame final';
  }
  throw 'erro';
}
