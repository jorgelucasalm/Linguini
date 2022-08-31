import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                const Header(
                  textButton: 'Login',
                ),
                const Padding(
                  padding: EdgeInsets.all(32),
                  child: Text(
                    "Cadastro",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xff422956),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      height: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextInput(text: 'User'),
                          TextInput(text: 'E-mail'),
                          TextInput(text: 'Confirmação de e-mail'),
                          TextInput(text: 'Senha'),
                        ],
                      ),
                    )),
                const StyledButton(text: 'Próximo', page: 1),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(246, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    side: const BorderSide(
                      width: 2,
                      color: Color(0xFF695876),
                    ),
                  ),
                  child: const Text(
                    'Já possuo conta',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xff422956),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ));
  }
}
