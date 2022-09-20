import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  late Timer _timer;
  int _counter = 10;

  void timer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          _timer.cancel();
        }
      });
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_counter == 0) {
        _counter = -1;
        Navigator.pushNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    timer();
    return Scaffold(
        backgroundColor: const Color(0xFFEAF5F1),
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
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: const <Widget>[
                    Text(
                      'Linguini',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xff422956),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Um novo jeito de cozinhar.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                        color: Color(0xff422956),
                      ),
                    ),
                  ],
                ),
              ),
              const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blue,
              ),
            ],
          ),
        ));
  }
}
