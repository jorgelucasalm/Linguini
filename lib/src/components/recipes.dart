import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final String cousine;
  final String diet;
  // ignore: non_constant_identifier_names
  final String prep_time;

  final void Function()? onPressed;

  const RecipeItem(
      {Key? key,
      required this.cousine,
      required this.diet,
      // ignore: non_constant_identifier_names
      required this.prep_time,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        children: [
          Row(
            children: [
              const Image(
                image: AssetImage('../assets/images/cover.png'),
                width: 150,
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 10,
                  children: [
                    Text(
                      cousine,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      diet,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      prep_time,
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
} 