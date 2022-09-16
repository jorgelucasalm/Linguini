import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';

class RegisterPage extends StatefulWidget {
  final String? title;
  final String? contentUser;

  const RegisterPage({Key? key, this.title, this.contentUser})
      : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = GlobalKey<FormState>();

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
                    textButton: 'Login',
                    onPressedBackButton: () =>
                        Navigator.pushNamed(context, '/'),
                    onPressedMainButton: () =>
                        Navigator.pushNamed(context, '/')),
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
                        // height: 240,
                        child: Form(
                      key: formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextInput(text: 'User'),
                          SizedBox(height: 10),
                          TextInput(text: 'E-mail'),
                          SizedBox(height: 10),
                          TextInput(text: 'Confirmação de e-mail'),
                          SizedBox(height: 10),
                          TextInput(text: 'Senha'),
                        ],
                      ),
                    ))),
                StyledButton(
                    text: 'Próximo',
                    onPressed: () => {
                          if (formkey.currentState!.validate())
                            {
                              Navigator.pushNamed(
                                  context, '/register/restriction'),
                            }
                        }),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/'),
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
