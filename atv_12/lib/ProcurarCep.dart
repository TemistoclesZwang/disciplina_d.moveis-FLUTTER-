import 'dart:convert';

// import 'package:atv_11/tela2.dart';
import 'package:atv_12/main.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'others/Cep.dart';

void main() => runApp(Tela1());

class Tela1 extends StatelessWidget {
  // create a constructor to initialize the variable
  Tela1({Key? key}) : super(key: key);
  // const Tela1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 198, 198, 198),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: T1HomePage(),
          ),
        ),
      ),
    );
  }
}


class T1HomePage extends StatefulWidget {
  var cepDoInput;
  T1HomePage({Key? key}) : super(key: key);
  @override
  T1HomePageState createState() => T1HomePageState();
}

class T1HomePageState extends State<T1HomePage> {
  String? cepDoInput;
  Future<List<Cep>> fetchCep(var cepNumber) async {
    final response = await http
        .get(Uri.parse('https://api.postmon.com.br/v1/cep/$cepNumber')); //!

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
        title: Text('Procurar CEP'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          //   FutureBuilder<dynamic>(
          //   future: fetchCep(gerarInputEPegarCep()),
          //   builder: (context, json) {
          //     if (json.hasData) {
          //       return ListView.builder(
          //         itemCount: json.data.length,
          //         itemBuilder: (context, index) {
          //             return TextButton(
          //               child: Text(
          //                 json.data![index].date!,
          //                 style: TextStyle(fontSize: 15),
          //               ),
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(builder: (context) =>
          //                     tela2(json.data![index].content!)),
          //                 );
          //               },
          //             );
          //         },
          //       );
          //     } else if (json.hasError) {
          //       return Text("${json.error}");
          //     }
          //     return Text('Buscando dados...');
          //   },
          // ),
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
          FutureBuilder<List<Cep>>(
          future: fetchCep(text),
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