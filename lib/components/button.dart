import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const StyledButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 252,
      height: 54,
      child: Stack(
        children: [
          TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffF5D950),
                fixedSize: const Size(246, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32)),
              ),
              child: const SizedBox.shrink()),
          Positioned(
            bottom: 0,
            right: 0,
            child: OutlinedButton(
              onPressed: onPressed,
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
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff422956),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
