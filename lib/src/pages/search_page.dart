import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
// import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';

class SearchPage extends StatefulWidget {
  final String? title;
  const SearchPage({Key? key, this.title}) : super(key: key);
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
                      image: AssetImage('assets/images/logo.png'),
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
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 296,
                      height: 240,
                      child: TextFormField(
                        // textAlignVertical: TextAlignVertical.bottom,
                        style: const TextStyle(
                          color: Color(0xFF695876), 
                          fontFamily: 'Poppins'
                        ),
                        
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
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
                      ),
                    )),
                const StyledButton(text: 'Buscar'),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}
