import 'package:flutter/material.dart';
import 'package:linguini/src/pages/restriction_page.dart';
import 'package:linguini/src/pages/register_page.dart';
import 'package:linguini/src/pages/login_page.dart';
import 'package:linguini/src/pages/search_page.dart';
import 'package:linguini/src/pages/results_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linguini',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/register/restriction': (context) => const RestrictionPage(),
        '/search': (context) => const SearchPage(),
        '/results': (context) => const ResultsPage(title: 'Comida vegana'),
      },
    );
  }
}
