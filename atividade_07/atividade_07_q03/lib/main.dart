import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 47, 40, 85),
        appBar: AppBar(
          title: Text('Slide de imagens'),
          backgroundColor: Color.fromARGB(255, 94, 74, 121),
        ),
        body: ImagePage(),
      ),
    ),
  );
}

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  int numeroImagem = 0;
  List<String> favoritos = [];

  void proxima() {
    setState(() {
      if (numeroImagem < 4) {
        numeroImagem += 1;
      }
    });
  }

  void anterior() {
    setState(() {
      if (numeroImagem > 0) {
        numeroImagem -= 1;
      }
    });
  }

  void favoritar() {
    favoritos.add('images/dice$numeroImagem.png');
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
//.IMAGEM
          Expanded(
            child: Image.asset('images/img$numeroImagem.png'),
            
          ),

//.ICON FAVORITO
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  favoritar();
                  print(favoritos);
                },
                icon: Icon(Icons.favorite),
                color: Colors.white,
                iconSize: 50,
                splashColor: Color.fromARGB(255, 255, 0, 106),
                // hoverColor: Colors.red,
              ),
            ],
          ),
//.VOLTAR E AVANÇAR
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  anterior();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 228, 90, 189),
                ),
                child: Text('anterior'),
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  proxima();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 228, 90, 189),
                ),
                child: Text('próxima'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
