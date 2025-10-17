import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  const Tela3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          scrollDirection:
              Axis.horizontal, //Indica que a rolagem será na horizontal
          children: [
            Row(
              children: [
                Container(width: 400, height: 600, color: Colors.blue),
                Container(width: 400, height: 600, color: Colors.blue),
                Container(width: 400, height: 600, color: Colors.blue),
                Container(width: 400, height: 600, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
