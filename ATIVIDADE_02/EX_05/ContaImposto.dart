// Crie uma classe chamada ContaImposto com um atributo saldo e número.
// a. Modifique os atributos para privado;
// b. Crie um método público chamado getSaldo( ) que retorna o saldo atual;
// c. Crie um construtor onde são passados os 2 parâmetros para setar os
// atributos;
// d. Implemente os métodos de crédito e débito como públicos;
// e. Crie um método privado chamado retemImposto(double valorDebito) que
// seja chamado toda vez que houver um débito e retire 0,38% do valor do
// débito;


import 'Conta.dart';

class ContaImposto extends Conta{
  double _saldo = 0;
  int _numero = 0;
  ContaImposto(this._saldo, this._numero); 

  get getSaldo => print(_saldo);
  set setSaldoCredito(double saldo) => this._saldo += saldo;
  set setSaldoDebito(double saldo) => this._saldo -= saldo;

  credito(double valor) {
    setSaldoCredito = valor;
  }
  

  debito(double valor) {
    setSaldoDebito = valor;
    _retemImposto(valor);
  }

  void _retemImposto(double valorDebito) {
    _saldo -= valorDebito * 0.38;
  }

}
