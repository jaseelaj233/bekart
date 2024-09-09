import 'package:bekart/home.dart';
import 'package:flutter/material.dart';

class Obj extends StatelessWidget {
  const Obj({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Home(),
              ));
            },
            icon: Icon(Icons.arrow_back)),
        Text(
          ' Thanks for your purchase',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
        )
      ],
    ));
  }
}
