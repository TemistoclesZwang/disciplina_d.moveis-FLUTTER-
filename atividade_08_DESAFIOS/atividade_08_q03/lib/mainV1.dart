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
  List<String> favoritos = [];
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

  void salvarLikes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('likes', likes);
    await prefs.setBool('like', true);
  }

  void lerLikes() {
    SharedPreferences.getInstance().then((prefs) {
      print(prefs.getBool('like'));
    });
  }
  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool checarSeImgTemLike() {
    if (numeroImagem == favoritos[numeroImagem]) { 
      return true;
    } else {
      return false;
    }
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
                icon: Icon(liked ? Icons.favorite : Icons.favorite_border),
                color: liked ? Colors.pink : Colors.grey,
                // color: _corAoClicar,
                iconSize: 50,
                splashColor: Color.fromARGB(255, 255, 0, 106),
                onPressed: () {
                  favoritar();
                  _pressionarLike();
                  print(favoritos);
                },
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
