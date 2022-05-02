import 'dart:convert';

// import 'package:atv_11/tela2.dart';
import 'package:atv_12/main.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'others/Cep.dart';

void main() => runApp(RastrearPacote());

class RastrearPacote extends StatelessWidget {
  // create a constructor to initialize the variable
  RastrearPacote({Key? key}) : super(key: key);
  // const RastrearPacote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 198, 198, 198),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: T2HomePage(),
          ),
        ),
      ),
    );
  }
}


class T2HomePage extends StatefulWidget {
  var cepDoInput;
  T2HomePage({Key? key}) : super(key: key);
  @override
  T2HomePageState createState() => T2HomePageState();
}

class T2HomePageState extends State<T2HomePage> {
  String? cepDoInput;
  Future<dynamic> fetchCep() async {
    final response = await http
        .get(Uri.parse('https://api.postmon.com.br/v1/cep/64006520')); //!

    if (response.statusCode != 200) {
      throw Exception('Failed to load album');
    }
    List listaDeRetorno = jsonDecode(response.body);
    return listaDeRetorno.map((item) => Cep.fromJson(item)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rastrear pacote'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                  label: Text('Voltar')),

          ]
              // !
              ),
              Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(50)),
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite o CEP',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onSubmitted: (text) {
//.buscar cep
          FutureBuilder<dynamic>(
          future: fetchCep(),
          builder: (context, json) {
            if (json.hasData) {
                  return ListTile(
                    title: Text(json.data![0].bairro!),
                  );
            } else if (json.hasError) {
              return Text("${json.error}");
            }
            return Text('Buscando dados...');

          },
        );
                // cep = text as int;
              },
              
            ),
//!
          ],
        ),
        ],
      ),
    );
  }
}

        // child: FutureBuilder<List<Album>>(
        //   future: fetchAlbum(),
        //   builder: (context, json) {
        //     if (json.hasData) {
        //           return ListTile(
        //             title: Text(json.data![0].title!),
        //           );
        //     } else if (json.hasError) {
        //       return Text("${json.error}");
        //     }
        //     return Text('Buscando dados...');

        //   },
        // ),
        // ),