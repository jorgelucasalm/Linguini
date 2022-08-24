import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RegisterPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF5F1),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                    padding: EdgeInsets.all(30)), //Espaçamento do topo

                //LEMBRETE: Adicionar botão de voltar

                TextButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                      fixedSize: const Size(100, 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: Color(0xFF695876),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF695876),
                      ),
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "Cadastro",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff422956),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'User',
                    labelStyle: const TextStyle(
                      fontSize: 50,
                      color: Color(0xFF695876),
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
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    labelStyle: const TextStyle(
                      fontSize: 50,
                      color: Color(0xFF695876),
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
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Confirmação de e-mail',
                    labelStyle: const TextStyle(
                      fontSize: 50,
                      color: Color(0xFF695876),
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
                const SizedBox(height: 8),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    labelStyle: const TextStyle(
                      fontSize: 50,
                      color: Color(0xFF695876),
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
              ],
            ),
          
            const SizedBox(height: 32),
            TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xffF5D950),
                  fixedSize: const Size(246, 48),
                  side: const BorderSide(
                    width: 2,
                    color: Color(0xff422956),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                ),
                child: const Text(
                  'Cadastrar',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff422956)),
                )),

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
                  color: Color(0xff422956),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
