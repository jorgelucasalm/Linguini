import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:linguini/api.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/info_box.dart';
import 'package:linguini/src/components/item.dart';

class VisualizationRecipe extends StatefulWidget {
  final int? recipe;
  const VisualizationRecipe({Key? key, this.recipe}) : super(key: key);

  @override
  State<VisualizationRecipe> createState() => _VisualizationRecipeState();
}

class _VisualizationRecipeState extends State<VisualizationRecipe> {
  get text => null;
  IconData? get search => null;
  dynamic recipeGetted = {};
  int id = -1;
  late Timer _timer;
  int _counter = 7;
  List<String> ingredients = [];
  List<String> instructions = [];

  @override
  void initState() {
    super.initState();
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
      id = widget.recipe!;
      recipeGetted = await Api.getRecipe(id);
      if (recipeGetted['ingredients'] != null) {
        ingredients = recipeGetted['ingredients'].split(" | ");
      }
      if (recipeGetted['instructions'] != null) {
        List<String> list = recipeGetted['instructions'].split(".");
        instructions = list
            .map((e) => e.trim())
            .toList()
            .where((element) => element.isNotEmpty).toList();
      }
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
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Wrap(children: [
                  Header(
                    backButton: true,
                    onPressedBackButton: () {
                      Navigator.pop(context);
                    },
                  ),
                  Row(
                    children: [
                      recipeGetted['image'] == null
                          ? const Text('')
                          : (() {
                              try {
                                final img = Image.network(
                                  recipeGetted['image']!,
                                  fit: BoxFit.fitWidth,
                                  width: 150,
                                  height: 150,
                                );
                                return img;
                              } catch (e) {
                                return const Image(
                                  image: AssetImage('assets/images/cover.png'),
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.fitWidth,
                                );
                              }
                            })(),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        child: Text(
                          recipeGetted['recipe_title'] != null
                              ? recipeGetted['recipe_title']
                              : '',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xff533D64),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoBox(
                        atributte: 'TEMPO',
                        value: recipeGetted['prep_time'] != null
                            ? recipeGetted['prep_time'].toString() + ' minutos'
                            : '',
                      ),
                      InfoBox(
                        atributte: 'COZINHA',
                        value: recipeGetted['cuisine'] != null
                            ? recipeGetted['cuisine']
                            : '',
                      ),
                      InfoBox(
                        atributte: 'DIETA',
                        value: recipeGetted['diet'] != null
                            ? recipeGetted['diet']
                            : '',
                      ),
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
                  if (ingredients.isNotEmpty)
                    ListView.builder(
                        itemCount: ingredients.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Item(text: ingredients[index]);
                        }),
                  // Item(text: 'Sabudana (pérolas de tapioca)'),
                  // Item(text: 'chalota'),
                  // Item(text: 'verduras misturadas'),
                  // Item(text: 'pimenta preta em pó'),
                  // Item(text: 'alho'),
                  // Item(text: 'óleo'),
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
                  if (instructions.isNotEmpty)
                    ListView.builder(
                        itemCount: instructions.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Item(text: instructions[index]);
                        }),
                  // const Item(
                  //     text:
                  //         'Para começar a fazer a receita de bolinho de sagu vegetariano, primeiro mergulhe as pérolas de sagu/tapioca em 1/2 xícara de água quente até que o sagu fique translúcido.'),
                  // const Item(
                  //     text:
                  //         'Lembre-se de não encharcar demais as pérolas, senão a massa fica encharcada.'),
                  // const Item(
                  //     text:
                  //         'Pique o alho, as folhas de coentro. Você também pode tirar algumas raízes de coentro.'),
                  // const Item(
                  //     text:
                  //         'Adicione a cebola picada e misture.Coloque um  Kadai/wok em fogo médio e aqueça o óleo.'),
                  // const Item(
                  //     text:
                  //         'Adicione a mistura picada, refogue até a cebola ficar translúcida e macia. '),
                  // const Item(
                  //     text:
                  //         'Quando a cebola estiver macia, adicione o repolho picado, a cenoura e o feijão. '),
                  // const Item(
                  //     text:
                  //         'Mexa bem para combinar. Em seguida, adicione o molho de soja e a pimenta em pó.'),
                  // const Item(
                  //     text:
                  //         'Refogue até que todos os ingredientes estejam bem combinados. Desligue o fogo. '),
                  // const Item(
                  //     text:
                  //         'Reserve e deixe o recheio esfriar completamente. Enquanto isso, pegue todo o sagu embebido em uma tigela depois de escorrer a água, molhe bem as mãos, amasse por 2 a 3 minutos até ficar bem maleável. Molhe as mãos e pegue uma pequena quantidade de massa, achate e faça uma forma de disco de cerca de 6 cm. '),
                  // const Item(
                  //     text:
                  //         'Decore com coentro fresco e sirva quente. Sirva a Receita de Bolinho de Sagu Vegetariano à noite, junto com azeite de alho e molho de soja para o lanche ou como acompanhamento  para fazer uma refeição'),
                ]),
              )),
        ));
  }
}
