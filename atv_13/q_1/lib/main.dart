import 'package:q_1/editor.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Editor de textos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controller = TextEditingController(); //!

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      autofocus:
      true;
      final String text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // List<bool> ativarDesativarSeletores = List.generate(5, (_) => false);
  List<bool> ativarDesativarSeletores = [false, false, false, false, false];
  String _textoRecebidoInput = ' ';
  late List _ListaTextoRecebidoInput;
  EditorTexto editorTexto = EditorTexto();
  int pegarBotaoSelecionado = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              // controller: _controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(30),
                border: OutlineInputBorder(),
                labelText: 'Digite seu texto',
              ),
              onFieldSubmitted: (String texto) {
                setState(() {
                  _textoRecebidoInput = texto; //!
                  // print(_textoRecebidoInput);
                });
              },
              onChanged: (String value) {
                setState(() {
                  _textoRecebidoInput = value;
                });
              },
            ),
            SizedBox(height: 20),
            ToggleButtons(
                borderRadius: BorderRadius.circular(20),
                children: <Widget>[
                  Icon(Icons.format_bold),
                  Icon(Icons.format_italic),
                  Icon(Icons.format_underline),
                  Icon(Icons.auto_fix_high), //gradient
                  Icon(Icons.invert_colors) 
                ],
                isSelected: ativarDesativarSeletores,
                onPressed: (int index) {

                  pegarBotaoSelecionado = index;
                  setState(() {
                    ativarDesativarSeletores[index] =
                        !ativarDesativarSeletores[index];
                    print(ativarDesativarSeletores);
                  });
                }),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                // text: _textoRecebidoInput,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: _textoRecebidoInput,
                    // style: editorTexto.SeletorEstilo(pegarBotaoSelecionado,ativarDesativarSeletores)),
                    style: (TextStyle(
                      fontWeight: ativarDesativarSeletores[0] ? FontWeight.bold:null,
                      fontStyle: ativarDesativarSeletores[1] ? FontStyle.italic:null,
                      decoration: ativarDesativarSeletores[2] ? TextDecoration.underline:null,
                      backgroundColor: ativarDesativarSeletores[3] ? Colors.amber:null,
                      color: ativarDesativarSeletores[4] ? 
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0):null,
                    )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
