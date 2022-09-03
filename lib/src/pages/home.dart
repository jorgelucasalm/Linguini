import 'package:flutter/material.dart';
import 'package:linguini/src/components/header.dart';
import 'package:linguini/src/components/button.dart';
import 'package:linguini/src/components/restriction_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  final List<bool> optionsRestrictition = [false, false, false, false];
  bool? noRestriction;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFEAF5F1),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
        ),
        body: Container(
          padding: const EdgeInsets.all(18),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 1000),
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: 20),
              const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blue,
              ),
            ],
          ),
        ));
  }
}
