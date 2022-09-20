import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/text_input.dart';
import 'package:linguini/src/components/button.dart';
import 'package:linguini/api.dart';

class LoginPage extends StatefulWidget {
  final String? title;
  const LoginPage({Key? key, this.title}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

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
                  textButton: 'Criar',
                  onPressedMainButton: () =>
                      Navigator.pushNamed(context, '/register'),
                ),
                const Padding(
                  padding: EdgeInsets.all(32),
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
                      // height: 160,
                      child: Form(
                        key: formkey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextInput(
                              text: 'User',
                              controller: usernameController,
                            ),
                            const SizedBox(height: 10),
                            TextInput(text: 'Senha', controller: passwordController,),
                          ],
                        ),
                      ),
                    )),
                TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                      textStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.only(bottom: 24),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Esqueci minha senha',
                    )),
                StyledButton(
                    text: 'Login',
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        Map<String, dynamic> result =
                            await Api.login(usernameController.text, passwordController.text);
                        if ((result['status'] == 400 || result['status'] == 401) && mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(result['message']),
                            behavior: SnackBarBehavior.floating,
                            duration: const Duration(seconds: 1),
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(24),
                            // ),
                            margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).size.height - 100,
                                right: 20,
                                left: 20),
                            backgroundColor: Colors.red,
                          ));
                        } else if (result['status'] == 200 && mounted) {
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
                          Navigator.pushNamed(context, '/search');
                        }
                      }
                    }),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/register'),
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
        ));
  }
}
