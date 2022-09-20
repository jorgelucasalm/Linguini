import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/button.dart';
import 'package:linguini/src/components/sliver_image.dart';
import 'package:linguini/src/components/cards_informativo.dart';



class VisualizationRecipe extends StatefulWidget {
  final String title;
  const VisualizationRecipe({Key? key, required this.title}) : super(key: key);

  @override
  State<VisualizationRecipe> createState() => _VisualizationRecipeState();
}


class _VisualizationRecipeState extends State<VisualizationRecipe> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(18),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Header(),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Receita",
                      style: TextStyle(
                        color: Color(0xff606060),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      )
                  )
              ),
              const Cards(),
              Divider(
                  height: 20,
                  thickness: 2,
                  color: Color(0xffD9D9D9)
              ),
              Container(
                padding: EdgeInsets.only(top: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("Ingredientes:",
                      style: TextStyle(
                        color: Color(0xff606060),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      )
                  )
              ),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  alignment: Alignment.centerLeft,
                  child: Text("Passo a passo:",
                      style: TextStyle(
                        color: Color(0xff606060),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      )
                  )
              ),




    ])));
  }

}