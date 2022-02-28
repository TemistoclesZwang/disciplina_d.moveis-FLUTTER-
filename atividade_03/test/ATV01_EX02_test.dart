// Declare e inicialize 3 variáveis: o dia
// de hoje, o mês e o ano e imprima a
// data na tela no formato
// “dia/mês/ano”. Use o operador $
// para interpolar as variáveis na string.

import 'package:test/test.dart';

void main() {
  group('Entradas, dia,mes, ano', () {
    test('testando entrada de dia', () {
      int dia = DateTime.now().day;
      expect(dia, isPositive);
      expect(dia, isNotNull);
      expect(dia, greaterThan(0));
      expect(dia, lessThan(32));
    });
    test('testando entrada do mês', () {
      int mes = DateTime.now().month;
      expect(mes, isPositive);
      expect(mes, isNotNull);
      expect(mes, greaterThan(0));
      expect(mes, lessThan(13));
    });
    test('testando entrada do ano', () {
      int ano = DateTime.now().year;
      expect(ano, isPositive);
      expect(ano, isNotNull);
      expect(ano, greaterThan(2021));
    });
  });

  group('Saida, interpolacao de String', () { //!slide
    String pegarDiaMesAno(int dia, int mes, int ano) {
      return "$dia/$mes/$ano";
    }

    test('testando o conteúdo da raw string', () { //!slide
      int dia = DateTime.now().day;
      int mes = DateTime.now().month;
      int ano = DateTime.now().year;
      String data = pegarDiaMesAno(dia, mes, ano);

      expect(data, isNotNull);
      expect(data, isNotEmpty);
      expect(data, contains('/'));
    });
  });
}
