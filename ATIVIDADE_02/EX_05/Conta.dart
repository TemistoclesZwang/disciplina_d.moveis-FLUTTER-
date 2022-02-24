class Conta {
  String _cliente = 'vazio';
  String _tipoConta = 'vazio';
  int _numero = 0;
  bool _ativada = false;

  CriarConta(String cliente, int numeroConta, String tipoConta) {
    this._cliente = cliente;
    this._numero = numeroConta;
    this._tipoConta = tipoConta;
    this._ativada = true;
  }

}
