import 'package:flutter/material.dart';

class ImageRecipe extends StatelessWidget {
  const ImageRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        child: Image.network(
                          "https://www.w3schools.com/w3css/img_lights.jpg",
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),)
                    ],)
              ),
            ],
          )
      );
    }
}
