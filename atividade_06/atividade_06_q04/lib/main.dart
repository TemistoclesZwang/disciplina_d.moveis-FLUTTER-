import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 28, 34),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildMainContainer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildStars(),
                      buildStars(),
                      buildStars(),
                      buildStars(),
                      buildStars(),
                    ],
                  ),
                    Container(
                      width: 200,
                      height: 200,
                      color: Color.fromARGB(30, 154, 223, 255),
                      
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('images/temistocles.jpeg'),
                    
                    ),
                  ),
                  buildCard('+55 86 99999 9999', Icons.phone),
                  buildCard('T.Zwang@gmail.com', Icons.email),
                ],
              ),
            ]),
      ),
    ),
  ));
}

Card buildCard(String text, IconData icon) {
  return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 100.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color.fromARGB(255, 0, 217, 255),
          
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20.0,
          ),
        ),
      ));
}

Icon buildStars() {
  return Icon(Icons.star, size: 40, color: Color.fromARGB(85, 0, 247, 255));
}

Container buildMainContainer(){
  return Container(
                height: 150,
                width: 400,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color.fromARGB(0, 15, 28, 34),
                      Color.fromARGB(255, 93, 236, 255),
                      Color.fromARGB(0, 15, 28, 34),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  // color: Color.fromARGB(255, 23, 43, 82),
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                ),
                child: Text(
                  'Temistocles Zwang',
                  style: new TextStyle(
                    color: Colors.white,
                      fontFamily: 'Altona',
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                ),
                ),
              );
}