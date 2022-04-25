
import 'dart:convert';

import 'package:atv_11/tela2.dart';
import 'package:flutter/material.dart';

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'others/News.dart';

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
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  Future<dynamic> fetchNews() async {
    final response = await http.get(
        Uri.parse('https://inshortsapi.vercel.app/news?category=technology'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load News');
    }
    // jsonDecode(response.body)['data'].map((item) => print(item));
    // List listaDeRetorno = jsonDecode(response.body);


    return jsonDecode(response.body)['data']
        .map((item) => News.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Noticias'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<dynamic>(
          future: fetchNews(),     
          builder: (context, json) {
            if (json.hasData) {
              return ListView.builder(
                itemCount: json.data.length,
                itemBuilder: (context, index) {
                    return TextButton(
                      child: Text(
                        json.data![index].date!,
                        style: TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => 
                            tela2(json.data![index].content!)),
                        );
                      },
                    );
                },
              );
            } else if (json.hasError) {
              return Text("${json.error}");
            }
            return Text('Buscando dados...');
          },
        ),
      ),
    );
  }
}
