import 'dart:convert' as convert;
import 'dart:convert';

import 'package:atv_12/screen2.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'others/model_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  

  final ScrollController _scrollController = ScrollController();
  bool liked = false;
  //list liked

  int _selectedIndex = 0;
  _onSelected(int index) {
    //https://inducesmile.com/google-flutter/how-to-change-the-background-color-of-selected-listview-in-flutter/
    setState(() {
      _selectedIndex = index;
    });
  }

  int numberOfItemsOnPage = 9;

  Future<List<ImgModel>> fetchImgModel() async {
    final response = await http.get(Uri.parse(
        'https://jsonplaceholder.typicode.com/photos?albumId=1&_limit=$numberOfItemsOnPage'));

    if (response.statusCode != 200) {
      throw Exception('Failed to load ImgModel');
    }
    List listaDeRetorno = jsonDecode(response.body);

    return listaDeRetorno.map((item) => ImgModel.fromJson(item)).toList();
  }

  //function to scroll images
  void checarScroll() {
    //!
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent &&
          numberOfItemsOnPage < 64) {
        setState(() {
          numberOfItemsOnPage += numberOfItemsOnPage;
          print(numberOfItemsOnPage);
        });
      }
    });
  }




  @override //!
  void initState() {
    super.initState();
    checarScroll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loja de tintas'),
        centerTitle: true,
      ),
      body: GridView.builder(
        controller: _scrollController, //!
        itemCount: numberOfItemsOnPage,
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
                return
                    // Column (
                    // children: <Widget>[
                    ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  leading: Image.network(
                    snapshot.data![index].thumbnailUrl!,
                    // width: 90,
                    // height: 150,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Cor: '),
                  subtitle: Text(snapshot.data![index].id!.toString()),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => tela2(
                          snapshot.data![index].title!,
                          snapshot.data![index].thumbnailUrl!,
                        ),
                      ),
                    );
                  },
                  trailing: FavoriteButton(
                      iconSize: 45,
                      isFavorite: false,
                      valueChanged: () {
                        setState(() {
                          liked = !liked;

                        });
                      }),
                );

                // ],
                // );

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


