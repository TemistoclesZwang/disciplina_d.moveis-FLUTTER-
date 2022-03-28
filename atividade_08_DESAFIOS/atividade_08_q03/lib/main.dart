import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
//. VARIAVEIS
  int numeroImagem = 0;
  List<int> favoritos = [];

  bool liked = false;
  int likes = 0;

  _pressionarLike() {
    setState(() {
      liked = !liked;
      if (liked) {
        likes++;
      } else {
        likes--;
      }
    });
  }

  bool checarFavoritoLista() {
    return favoritos.contains(numeroImagem);
  }

  _salvarFavoritoLista() {
    setState(() {
      if (checarFavoritoLista()) {
        favoritos.remove(numeroImagem);
      } else {
        favoritos.add(numeroImagem);
      }
    });
  }

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

  // dict with key and value
  Map<int, dynamic> _imgDict = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
  };


//get value from dict
  bool? getImagem(int key) {
    return _imgDict[key];
  }

//set a value in dict
  setImagem(int key, bool value) {
    _imgDict[key] = value;
  }

//save _imgDict with shared preferences json
  Future<void> _saveImgDict() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('imgDict', jsonEncode(_imgDict));
  }

  Future<void> _loadImgDict() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var imgDict = jsonDecode(prefs.getString('imgDict') ?? '{}');
    setState(() {
      //img dict convert from jsonMap to Map
      _imgDict = imgDict;
    });
  }

  IconButton _buildIconButtonLike() {
    return IconButton(
      icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
      color: liked ? Colors.pink : Colors.grey,
      // color: _corAoClicar,
      iconSize: 50,
      splashColor: Color.fromARGB(255, 255, 0, 106),
      onPressed: () {
        _pressionarLike();
        setImagem(numeroImagem, liked);
        _salvarFavoritoLista();
        _saveImgDict();
      },
    );
  }


  @override
  Widget build(BuildContext context) {
//.CARREGAR DADOS
    _loadImgDict();

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
              _buildIconButtonLike()
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
