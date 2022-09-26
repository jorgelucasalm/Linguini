import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:linguini/api.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/ingredient.dart';
import 'package:linguini/src/components/recipes.dart';
import 'package:linguini/src/pages/search_page.dart';
import 'package:linguini/src/pages/visualization_recipe.dart';

class ResultsPage extends StatefulWidget {
  final List<String>? ingredients;
  const ResultsPage({Key? key, this.ingredients}) : super(key: key);

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  get text => null;
  IconData? get search => null;
  List<String> ingredients = [];
  List<dynamic> recipes = [];
  late Timer _timer;
  int _counter = 7;

  @override
  void initState() {
    super.initState();
    ingredients = widget.ingredients!;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });

    () async {
      recipes = await Api.listRecipes(ingredients);
      print(recipes);
    }();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_counter == 0) {
        _counter = -1;
      }
    });
  }

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
                Header(
                  backButton: true,
                  onPressedBackButton: () {
                    Navigator.pop(context);
                  },
                ),
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
                                children: ingredients
                                    .map(
                                      (item) => IngredientButton(text: item),
                                    )
                                    .toList(),
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
                        if (_counter < 1)
                          ListView.builder(
                              itemCount: recipes.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                VisualizationRecipe(
                                              recipe: recipes[index]['id'],
                                            ),
                                          ));
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAlias,
                                      child: Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              recipes[index]['recipe_title']
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(16.0),
                                              child: RecipeItem(
                                                cousine: recipes[index]
                                                        ['cuisine']
                                                    .toString(),
                                                diet: recipes[index]['diet']
                                                    .toString(),
                                                prep_time: recipes[index]
                                                        ['prep_time']
                                                    .toString(),
                                              ))
                                        ],
                                      ),
                                    ),
                                  )),
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
