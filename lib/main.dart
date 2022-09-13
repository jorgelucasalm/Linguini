import 'package:flutter/material.dart';
import 'package:linguini/src/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(title: 'Flutter Demo Home Page'),
    );
  }
}
