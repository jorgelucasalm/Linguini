import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final void Function()? onPressedBackButton;
  final String? textButton;
  final void Function()? onPressedMainButton;

  const Header(
      {Key? key,
      this.textButton,
      this.onPressedBackButton,
      this.onPressedMainButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // BackButton(
          //   color: const Color(0xFF695876),
          //   onPressed: onPressedBackButton,
          // ),
          textButton != null
              ? (OutlinedButton(
                  onPressed: onPressedMainButton,
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
                  child: Text(
                    textButton.toString(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF695876),
                    ),
                  )))
              : (const SizedBox.shrink()),
        ],
      ),
    );
  }
}
