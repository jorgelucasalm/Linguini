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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(padding: EdgeInsets.all(60)), //Espaçamento do topo

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
          const Text(
            'Cadastro',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff422956),
            ),
          ),
          const SizedBox(height: 32),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF695876),
                    ),
                  ),
                  focusColor: Color(0xFF695876),
                  hintText: 'User',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF695876),
                    ),
                  ),
                  hintText: 'E-mail',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF695876),
                    ),
                  ),
                  hintText: 'Confirmação de e-mail',
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF695876),
                    ),
                  ),
                  hintText: 'Senha',
                ),
              )
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
                    fontWeight: FontWeight.w800,
                    color: Color(0xff422956)),
              )),
          const SizedBox(height: 16),
          TextButton(
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
                fontWeight: FontWeight.w800,
                color: Color(0xff422956),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
