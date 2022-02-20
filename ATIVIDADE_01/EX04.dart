// Em  uma  empresa  os  funcionários
// renovam o contrato por três anos. O
// salário  sofrerá  um  reajuste  de  7%,
// 6% e 5%, respectivamente, nos
// próximos três anos. Escreva um
// script que declare uma variável com
// o salário mensal atual do
// funcionário, e então, imprima o
// salário  mensal  para  cada  um  dos
// três próximos anos.

void main() {
  double salarioAtual = 1200;
  String ano1 = calc(salarioAtual, 0.07);
  String ano2 = calc(salarioAtual, 0.06);
  String ano3 = calc(salarioAtual, 0.05);

  print("Salário atual: $salarioAtual\n");

  print("Salário 1º ano: $ano1");
  print("Salário 2º ano: $ano2");
  print("Salário 3º ano: $ano3");
}

String calc(atual, porcentagem) {
  double calculo = atual * porcentagem;
  String casasDecimais = calculo.toStringAsFixed(2);
  return casasDecimais;
}
