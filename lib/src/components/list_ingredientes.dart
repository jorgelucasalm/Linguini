import 'package:flutter/material.dart';

class ListIngredientes extends StatelessWidget {
  const ListIngredientes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.fiber_manual_record),
            title: Text("Ingrediente 1",
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                color: Color(0xff7A7A7A)
            )),
          )

          ]
      );
  }
}
