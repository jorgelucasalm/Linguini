import 'package:flutter/material.dart';

import 'package:linguini/src/pages/register_page.dart';
import 'package:linguini/src/pages/login_page.dart';
import 'package:linguini/src/pages/search_page.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final int page;
  final void Function()? onPressed;

  const StyledButton(
      {Key? key, required this.text, required this.page, this.onPressed})
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if (page == 1) {
                    return const SearchPage(title: 'Flutter Demo Home Page');
                  } else if (page == 2) {
                    return const LoginPage(title: 'Flutter Demo Home Page');
                  } else {
                    return const RegisterPage(title: 'Flutter Demo Home Page');
                  }
                }));
              },
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
