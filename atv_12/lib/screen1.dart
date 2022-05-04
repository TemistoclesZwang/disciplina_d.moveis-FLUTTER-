import 'dart:convert';

import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'others/model_image.dart';

void main() => runApp(Tela1());

class Tela1 extends StatelessWidget {
  const Tela1({Key? key}) : super(key: key);

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

  get index => null;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<List<ImgModel>> fetchImgModel() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?albumId=1&_limit=6'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load ImgModel');
    }
    List listaDeRetorno = jsonDecode(response.body);
    // print(listaDeRetorno);
    // print(listaDeRetorno.map((item) => item));
    return listaDeRetorno.map((item) => ImgModel.fromJson(item)).toList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de imagens'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 5,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return FutureBuilder<List<ImgModel>>(
            future: fetchImgModel(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Image.network(
                    snapshot.data![index].url!,
                    fit: BoxFit.cover,
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          );
        },
      ),
    );
  }
}

