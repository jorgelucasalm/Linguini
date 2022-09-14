import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/button.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:linguini/src/pages/data.dart';

class SearchPage extends StatefulWidget {
  final String title;
  const SearchPage({Key? key, required this.title}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                SizedBox(
                    height: 40,
                    width: 296,
                    child: TypeAheadField(
                      noItemsFoundBuilder: (context) => const SizedBox(
                        height: 50,
                        child: Center(
                          child: Text('No Item Found'),
                        ),
                      ),

                      suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                          color: Colors.white,
                          elevation: 4.0,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )
                      ),

                      debounceDuration: const Duration(milliseconds: 400),
                      textFieldConfiguration: TextFieldConfiguration(
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(32)),
                              borderSide:  BorderSide(
                                color: Color(0xFF695876),
                                width: 2,
                              ),
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),

                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                            borderSide:  BorderSide(
                              color: Color(0xFF695876),
                              width: 1,
                            ),
                          ),

                          hintText: "Busca",
                          contentPadding: const EdgeInsets.only(top: 8, left: 24),
                          hintStyle: const TextStyle(
                            color: Color(0xFF695876), 
                            fontSize: 14
                          ),

                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search, 
                              color: Color(0xFF695876),
                            ),
                          ),

                          fillColor: Colors.white, filled: true 
                        )  
                      ),
                      suggestionsCallback: (value) {
                        return StateService.getSuggestions(value);
                      },
                      itemBuilder: (context, String suggestion) {
                        return Row(
                          children: [
                            const SizedBox(width: 4),
                            const SizedBox(width: 2),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  suggestion,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      onSuggestionSelected: (String suggestion) {  }, //construir função
                    )
                  ),  

                const SizedBox(height: 200),
                const StyledButton(text: 'Buscar'),
                const SizedBox(height: 16),
              ],
            ),
          ),
        )
    );
  }
}
