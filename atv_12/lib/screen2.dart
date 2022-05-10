import 'package:flutter/material.dart';
import 'others/model_image.dart';

class tela2 extends StatelessWidget {
  String? descricaoImg;
  String? miniThumbnail;

  tela2(this.descricaoImg,this.miniThumbnail, {ImgModel? imgModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second screen"),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Detalhes:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$descricaoImg',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height: 150,
              width: 150,
              //decoration border radius
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: NetworkImage('$miniThumbnail'),
                  fit: BoxFit.cover,
                ),
              ),
              ),
            // SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
