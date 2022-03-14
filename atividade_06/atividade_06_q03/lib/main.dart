import 'package:flutter/material.dart';

final Shader gerarGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 88, 68, 218), 

    Color.fromARGB(255, 97, 234, 255)],
    


).createShader(Rect.fromLTWH(90.0, 0.0, 500.0, 0.0));


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 13, 17, 63),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/temistocles.jpeg'),
              ),
              Text(
                'Temistocles Zwang',
                style: new TextStyle(
                    fontFamily: 'Star',
                    fontSize: 40.0,
                    // fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = gerarGradient),
              ),
              SizedBox(
                height: 50.0,
                width: 350.0,
                child: Divider(
                  thickness: 0.5,
                  color: Colors.teal.shade100,
                ),
              ),
                Container(
                child: 
                Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    letterSpacing: 2.5,
                    fontWeight: FontWeight.bold),
              ),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(35, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20)
                  ),
                ),
              ),
                buildCard('+55 86 99999 9999', Icons.phone),
                buildCard('Temistocles.Zwang', Icons.email),
            ],
          ),
        ),
      ),
    ),
  );
}

Card buildCard(String text, IconData icon) {
  return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
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
