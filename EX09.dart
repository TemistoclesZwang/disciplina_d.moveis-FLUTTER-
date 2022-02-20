// Estude e aprofunde seus
// conhecimentos sobre tratamento de
// variáveis  nulas  no  dart  e  grave  um
// vídeo apresentando 3 distintos
// exemplos  a  respeito  disponível  do
// repositório da atividade

import 'dart:io';

void main() {
  // entradaDados
  stdout.write('insira um dado:');
  String? dadoString = stdin.readLineSync(); //!1

  //parse devido ao stdout pegar String
  if (dadoString != null) {
    //!2
    int dia = int.parse(dadoString);
  }
  //ou
    int dia = int.parse(dadoString!); //!3

}

  void cantorElvis() {
    int login = 2;
    int senha = 2;

    final elvisOperator = login?.senha?.elvisOperator; //!4
  }

//!5 throw
