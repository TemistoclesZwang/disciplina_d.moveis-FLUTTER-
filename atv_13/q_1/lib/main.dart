import 'package:/q_1/editor.dart';
import 'package:flutter/material.dart';

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

  List<bool> _ativarDesativarSeletores = List.generate(5, (_) => false);
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
                  _ListaTextoRecebidoInput =
                      editorTexto.SplitDotexto(texto); //!
                  print(_textoRecebidoInput);
                });
              },
              onChanged: (String value) {
                setState(() {
                  _textoRecebidoInput = value;
                  // print(_textoRecebidoInput);
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
                  Icon(Icons.format_color_fill), //gradient
                  Icon(Icons.format_clear), //limpar
                ],
                // isSelected: <bool>[
                //   false,
                //   false,
                //   false,
                // ],
                isSelected: _ativarDesativarSeletores,
                onPressed: (int index) {
                  // editorTexto.Negrito(
                  // _textoRecebidoInput); //!enviar somente index
                  pegarBotaoSelecionado = index;
                  setState(() {
                    _ativarDesativarSeletores[index] =
                        !_ativarDesativarSeletores[index];
                  });
                }),
            SizedBox(height: 40),
            RichText(
              text: TextSpan(
                // text: _textoRecebidoInput,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: _textoRecebidoInput,
                      style: editorTexto.SeletorEstilo(pegarBotaoSelecionado)),
                  // style: TextStyle(fontWeight: FontWeight.bold)),
                  //!aplicar style de acordo com index recebido
                  // TextSpan(text: 'italico', style: TextStyle(fontStyle: FontStyle.italic)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//! usar rich text para implementar negrito,italico,etc
//. fazer o split da frase digitada
//;como selecionar o texto a ser negrito,italico,etc ?
//. cada i do split vai para dentro de um span do rich text
//. cada icon do toggle ativa ou desativa o span
