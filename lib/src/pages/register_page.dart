import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';
import 'package:linguini/api.dart';

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

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

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
                    onPressedMainButton: () =>
                        Navigator.pushReplacementNamed(context, '/login')),
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
                          TextInput(
                            text: 'User',
                            controller: usernameController,
                          ),
                          SizedBox(height: 10),
                          TextInput(
                            text: 'E-mail',
                            controller: emailController,
                          ),
                          SizedBox(height: 10),
                          TextInput(text: 'Confirmação de e-mail'),
                          SizedBox(height: 10),
                          TextInput(
                            text: 'Senha',
                            controller: passwordController,
                          ),
                        ],
                      ),
                    ))),
                StyledButton(
                    text: 'Próximo',
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        Map<String, dynamic> result = await Api.createUser(
                            usernameController.text,
                            passwordController.text,
                            emailController.text);
                        if ((result['status'] == 400 ||
                                result['status'] == 401) &&
                            mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result['message']),
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 1),
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 100,
                                right: 20,
                                left: 20),
                            backgroundColor: Colors.red,
                          ));
                        } else if (result['status'] == 200 ||
                            result['status'] == 201 && mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result['message']),
                            duration: const Duration(seconds: 1),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 100,
                                right: 20,
                                left: 20),
                            backgroundColor: Colors.green,
                          ));
                          Navigator.pushNamed(context, '/register/restriction');
                        }
                      }
                    }),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
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
