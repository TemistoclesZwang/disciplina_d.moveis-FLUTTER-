import 'dart:convert' as convert;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'others/Album.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 198, 198, 198),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: MyHomePage(),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Album>> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

    if (response.statusCode != 200) {
      throw Exception('Não foi possivel carregar o dado');
    }
    List listaDeRetorno = jsonDecode(response.body);
    return listaDeRetorno.map((dados) => Album.fromJson(dados)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pegando lista'),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: fetchAlbum(),
          builder: (context, json) {
            if (json.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      json.data![index].title!,
                      style: TextStyle(fontSize: 20),
                    )
                  ); 
                },
              );
            } else if (json.hasError) {
              return Text("Erro inesperado: ${json.error}");
            }
            return Text('Buscando dados...');
          },
        ),
      ),
    );
  }
}
