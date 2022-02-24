import 'Calculadora.dart';
import 'ContaImposto.dart';

void main() {
  Calculadora calc = new Calculadora.ConstrutorNomeado(19.0, 2.0);
  print(calc.somar());
  // .tentando acessar diretamente
  // print(Calculadora._op1);
  // print(Calculadora._op2);

}
