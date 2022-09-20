import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/ingredient.dart';
import 'package:linguini/src/components/recipes.dart';

class ResultsPage extends StatefulWidget {
  final String title;
  const ResultsPage({Key? key, required this.title}) : super(key: key);
  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  get text => null;
  IconData? get search => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFEAF5F1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Header(),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  alignment: Alignment.topLeft,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          'Resultados para:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 4,
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(16.0),
                              child: Wrap(
                                alignment: WrapAlignment.start,
                                spacing: 8,
                                runSpacing: 10,
                                children: const [
                                  IngredientButton(text: 'Ovo'),
                                  IngredientButton(text: 'Alho Poró'),
                                  IngredientButton(text: 'Uva galática'),
                                  IngredientButton(text: 'Alho Poró'),
                                  IngredientButton(text: 'Uva galática'),
                                ],
                              )),
                        ),
                        const Text(
                          'Sugestões:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            height: 4,
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              const ListTile(
                                title: Text(
                                  'Receita X',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: RecipeItem(
                                  cousine: 'Tailandesa',
                                  diet: 'Vegana',
                                  prep_time: "15 min",
                                )
                              )
                            ],
                          ),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}