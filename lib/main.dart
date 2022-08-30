import 'package:flutter/material.dart';
import 'package:linguini/src/pages/register_page.dart';
import 'package:linguini/src/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}
