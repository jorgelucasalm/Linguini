import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  textButton: 'Criar',
                ),
                const Padding(
                  padding: EdgeInsets.all(75),
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                      color: Color(0xff422956),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: SizedBox(
                      height: 120,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TextInput(text: 'User'),
                          TextInput(text: 'Senha'),
                        ],
                      ),
                    )),
              TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 16),
                  padding: EdgeInsets.only(bottom:24),
              ),
              onPressed: () {},
              child: const Text('Esqueci minha senha',)
              ),
                const StyledButton(text: 'Login'),
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
                    'Não possuo conta',
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
        )
    );
  }
}