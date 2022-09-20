import 'package:flutter/material.dart';
class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top:20, bottom: 14),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                  child: Center(child:SizedBox(
                    width: 110,
                    height: 110,
                    child: Center(child: ListTile(
                      title: Text("TEMPO",
                      style: TextStyle(
                          color: Color(0xFFAE97C0),
                        fontSize: 14
                      )),
                      subtitle: Text("15 minutos",
                      style: TextStyle(
                        color: Color(0xff533D64),
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      )),
                    ))
                    ),
                  )
              ),

              Card(
                  child: Center(child:SizedBox(
                      width: 110,
                      height: 110,
                      child: Center(child: ListTile(
                        title: Text("COZINHA",
                            style: TextStyle(
                                color: Color(0xFFAE97C0),
                              fontSize: 14
                            )),
                        subtitle: Text("Indiana",
                            style: TextStyle(
                                color: Color(0xff533D64),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            )),
                      ))
                  ),
                  )
              ),

              Card(
                  child: Center(child:SizedBox(
                      width: 110,
                      height: 110,
                      child: Center(child: ListTile(
                        title: Text("DIETA",
                            style: TextStyle(
                                color: Color(0xFFAE97C0),
                              fontSize: 14
                            )),
                        subtitle: Text("Vegana",
                            style: TextStyle(
                                color: Color(0xff533D64),
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            )),
                      ))
                  ),
                  )
              )
            ]
        )
    );
  }
}
