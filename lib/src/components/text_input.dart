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
        // textAlignVertical: TextAlignVertical.bottom,
        style: const TextStyle(
          color: Color(0xFF695876),
          fontFamily: 'Poppins'
        ),
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