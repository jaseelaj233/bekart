import 'package:flutter/material.dart';

class Examp extends StatelessWidget {
  const Examp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'uu',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/WhatsApp Image 2024-09-01 at 11.28.26 PM.jpeg'),
                        fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
        Text(
          'aaa',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Text('aa'),
        Text('aa'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.delete),
          ],
        )
      ]),
    ));
  }
}
