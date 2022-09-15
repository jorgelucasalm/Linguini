import 'package:flutter/material.dart';

class IngredientButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const IngredientButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xffFBF6FF),
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        ),
        onPressed: null,
        child: Text(
          text, //recebe o texto
          style: const TextStyle(
            color: Color(0xff422956),
            fontSize: 12,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}