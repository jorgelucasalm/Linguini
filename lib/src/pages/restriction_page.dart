import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/button.dart';
import 'package:linguini/src/components/restriction_button.dart';

class RestrictionPage extends StatefulWidget {
  const RestrictionPage({Key? key}) : super(key: key);

  @override
  State<RestrictionPage> createState() => _RestrictionPageState();
}

class _RestrictionPageState extends State<RestrictionPage> {
  final List<bool> optionsRestrictition = [false, false, false, false];
  bool? noRestriction;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEAF5F1),
        body: Container(
          padding: const EdgeInsets.all(18),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const Header(),
              const Text('Restrição alimentar?',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins')),
              Padding(
                  padding: const EdgeInsets.only(top: 56, bottom: 82),
                  child: Center(
                    child: SizedBox(
                      width: 242,
                      height: 266,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestrictionButton(
                                text: 'Sem restrições',
                                imgSrc: 'restriction_image_1.png',
                                optionsRestrictition: optionsRestrictition,
                                index: 0,
                                noRestriction: noRestriction,
                              ),
                              RestrictionButton(
                                text: 'Diabetes',
                                imgSrc: 'restriction_image_2.png',
                                optionsRestrictition: optionsRestrictition,
                                index: 1,
                                noRestriction: noRestriction,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RestrictionButton(
                                text: 'Vegetariana',
                                imgSrc: 'restriction_image_3.png',
                                optionsRestrictition: optionsRestrictition,
                                index: 2,
                                noRestriction: noRestriction,
                              ),
                              RestrictionButton(
                                text: 'Vegana',
                                imgSrc: 'restriction_image_4.png',
                                optionsRestrictition: optionsRestrictition,
                                index: 3,
                                noRestriction: noRestriction,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
              const StyledButton(text: 'Criar Conta')
            ],
          ),
        ));
  }
}
