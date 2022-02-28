// Exiba numa raw string a frase, 
// incluindo as aspas: O caractere de 
// escape \t representa uma 
// “tabulação”
import 'package:test/test.dart';

void main() {
  test('verificando string', () {
    String frase = r'O caractere de escape \t representa uma "tabulação"';
    print(frase);
    expect(frase, allOf(
      contains('\\t'),
      contains('"tabulação"')));
  });
}