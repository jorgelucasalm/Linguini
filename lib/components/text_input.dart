import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? text;

  const TextInput({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 296,
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: text,
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
    );
  }
}
