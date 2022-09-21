import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/info_box.dart';
import 'package:linguini/src/components/item.dart';

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
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Wrap(children: [
                  const Header(),

                  Row(
                    children: [
                      Image.asset(
                        "assets/images/cover.png",
                        width: 150,
                      ),
                      const SizedBox(width: 16,),
                      const Text(
                        'Lasanha de Beringela',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xff533D64),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      InfoBox(atributte: 'TEMPO', value: '15 minutos'),
                      InfoBox(atributte: 'COZINHA', value: 'Indiana'),
                      InfoBox(atributte: 'DIETA', value: 'Vegana'),
                    ],
                  ),
                  const Divider(),
                  const Text(
                    'Ingredientes',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff533D64),
                      height: 3,
                    ),
                  ),
                  const Item(text: 'Lasanha'),
                  const Item(text: 'Beringela'),
                  const Divider(),
                  const Text(
                    'Passo a passo',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xff533D64),
                      height: 3,
                    ),
                  ),
                  const Item(text: 'Faça uma lasanha'),
                  const Item(text: 'Coloque beringelas'),
                ]),
              )
          ),
        )
    );
  }
}