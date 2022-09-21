import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String atributte;
  final String value;
  const InfoBox({Key? key, required this.atributte, required this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 20, bottom: 14),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  child: Center(
                    child: SizedBox(
                        width: 110,
                        height: 80,
                        child: Center(
                            child: ListTile(
                              title: Text(
                                  atributte,
                                  style: const TextStyle(
                                    color: Color(0xFFAE97C0),
                                    fontSize: 12,
                                  )),
                              subtitle: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Color(0xff533D64),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                            )
                        )
                    ),
                  )
              ),
            ]));
  }
}