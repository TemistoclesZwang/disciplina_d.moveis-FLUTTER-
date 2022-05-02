import 'dart:convert';

// import 'package:atv_11/tela2.dart';
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
  // var cepDoInput;
  T1HomePage({Key? key}) : super(key: key);
  @override
  T1HomePageState createState() => T1HomePageState();
}

class T1HomePageState extends State<T1HomePage> {
  Future<dynamic> fetchCep() async {
    // String? cepDoInput;

    final response = await http
        .get(Uri.parse('https://api.postmon.com.br/v1/cep/64006520')); //!

    if (response.statusCode != 200) {
      throw Exception('Failed to load News');
    }
    // print(response.body);
    // jsonDecode(response.body)['bairro'].map((item) => print(item));
    // List listaDeRetorno = jsonDecode(response.body);
    var jdc = jsonDecode(response.body) as Map<String, dynamic>;
    return jdc .map((item) => Cep.fromJson(item)).toList();
  }


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Cep'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: fetchCep(),
            builder: (context, AsyncSnapshot snapshot) {//.tipagem
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return TextButton(
                      onPressed: () {},
                      child: Text(
                        snapshot.data![index].bairro!,
                        style: TextStyle(fontSize: 15),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Text('Buscando dados...');
            },
          ),
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