import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linguini/src/components/header.dart';
// import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';
import 'package:substring_highlight/substring_highlight.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, required this.title}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  get text => null;

  IconData? get search => null;

  bool isLoading = false;
  late List<String> autoCompleteData;
  late TextEditingController controller;

  Future fetchAutoCompleteData() async {
    setState(() {
      isLoading = true;
    });

    final String stringData = await rootBundle.loadString("assets/data.json");
    final List<dynamic> json = jsonDecode(stringData);
    final List<String> jsonStringData = json.cast<String>();

    setState(() {
      isLoading = false;
      autoCompleteData = jsonStringData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAutoCompleteData();
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
                const Header(),
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Column(children: const [
                      Image(
                        image: AssetImage('../assets/images/logo.png'),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Um novo jeito de cozinhar.",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                          color: Color(0xff422956),
                        ),
                      ),
                    ]),
                  ),

                  //SearchBar
                  Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: SizedBox(
                        width: 296,
                        height: 240,
                        child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Autocomplete(
                                    optionsBuilder: (TextEditingValue textEditingValue) {
                                      if (textEditingValue.text.isEmpty) {
                                        return const Iterable<String>.empty();
                                      } else {
                                        return autoCompleteData.where((word) => word
                                          .toLowerCase()
                                          .contains(textEditingValue.text.toLowerCase()));
                                      }
                                    },

                                    optionsViewBuilder: (context, Function(String) onSelected, options) {
                                      return Material(
                                        
                                        child: ListView.separated(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, index) {
                                              final option = options.elementAt(index);
                                              return ListTile(
                                                title: SubstringHighlight(
                                                  text: option.toString(), 
                                                  term: controller.text,
                                                  textStyleHighlight: const TextStyle(fontWeight: FontWeight.w700),
                                                ),
                                                onTap: (){
                                                  onSelected(option.toString());
                                                },
                                              );
                                            }, 
                                            separatorBuilder: (context, index) => Divider(), 
                                            itemCount: options.length,
                                          ),
                                        );
                                    },

                                    onSelected: (selectedString){
                                      print(selectedString); //CONSTRUIR A FUNÇÃO
                                    },

                                    fieldViewBuilder: ((context, controller, focusNode, onEditingComplete){
                                      this.controller = controller;

                                      return TextField(
                                        controller: controller,
                                        focusNode: focusNode,
                                        onEditingComplete: onEditingComplete,
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(horizontal: 24),
                                          hintText: 'Busca',
                                          suffixIcon: const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 24),
                                            child: Icon(
                                              Icons.search,
                                              color: Color(0xFF695876),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(32),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(32),
                                            borderSide: const BorderSide(
                                              color: Color(0xFF695876),
                                              width: 2,
                                            ),
                                          ),
                                        ),
                                      );
                                    })
                                  ),
                                ],
                              ),
                            )
                      )
                  ),
                const StyledButton(text: 'Buscar'),
                const SizedBox(height: 16),
              ],
            ),
          ),
        )
    );
  }
}
