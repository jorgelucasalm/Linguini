import 'package:flutter/material.dart';

class SearchPageButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const SearchPageButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      decoration: const BoxDecoration(
          color: Color(0xfff),
          borderRadius: BorderRadius.all(Radius.circular(32))),
      child: Wrap(
        spacing: 10,
        crossAxisAlignment: WrapCrossAlignment.center, children: [
        Text(
          text, //recebe o texto
          style: const TextStyle(
            color: Color(0xff422956),
            fontSize: 18,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.close),
        )
      ]),
    );
  }
}
