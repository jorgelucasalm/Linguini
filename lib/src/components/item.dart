import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String text;
  const Item({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children:[
          ListTile(
            leading: const Icon(
              Icons.fiber_manual_record,
              size: 12,
              color: Color(0xFFAE97C0),),
            title: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Color(0xff533D64),
                  fontWeight: FontWeight.w500,
                )
            ),
          )
        ]
    );
  }
}