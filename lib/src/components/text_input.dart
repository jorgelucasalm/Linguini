import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? text;
  final String? email;
  final String? emailV;
  final TextEditingController? controller;

  const TextInput(
      {Key? key, this.text, this.email, this.emailV, this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 296,
      // height: 48,
      child: TextFormField(
        controller: controller,
        // textAlignVertical: TextAlignVertical.bottom,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: text == 'Senha' ? true : false,
        style: const TextStyle(color: Color(0xFF695876), fontFamily: 'Poppins'),
        onChanged: (value) => {
          // if (text == 'E-mail') {email = value, print('email')},
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Este campo precisa ser preenchido!";
          }

          if ((text == 'E-mail' || text == 'Confirmação de e-mail') &&
              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                  .hasMatch(value)) {
            return "Formato do Email incorreto! ";
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          hintText: text,
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
    );
  }
}
