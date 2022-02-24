// Crie uma classe Calculadora que tenha dois atributos privados (operando1 e 2) e:

// a. Crie 2 métodos públicos, cada um representando uma operação básica;
// b. Crie um construtor onde são passados os operandos;
// c. Crie uma classe que teste a classe calculadora. Tente acessar os atributos
// diretamente e verifique o que acontece.

class Calculadora {
  // private atributo
  double _op1 = 0;
  double _op2 = 0;

  //construtor nomeado
  Calculadora.ConstrutorNomeado(double op1, double op2) {
    this._op1 = op1;
    this._op2 = op2;
  }

  double get getOp1 => _op1;

  double get getOp2 => _op2;

  set setOp1(double op1) => _op1 = op1;
  set setOp2(double op2) => _op2 = op2;

  modificarOperadores(double op1, double op2) {
    // this._op1 = op1;
    // this._op2 = op2;
    setOp1 = op1;
    setOp2 = op2;
  }

  somar() {
    return getOp1 + getOp2;
  }

  multiplicar() {
    return getOp1 * getOp2;
  }
}
