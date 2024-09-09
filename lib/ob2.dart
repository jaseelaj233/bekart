import 'package:bekart/login.dart';
import 'package:bekart/ob3.dart';
import 'package:flutter/material.dart';

class Ob2 extends StatefulWidget {
  const Ob2({super.key});

  @override
  State<Ob2> createState() => _Ob2State();
}

class _Ob2State extends State<Ob2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/WhatsApp Image 2024-08-28 at 2.16.53 PM.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50)),
                      color: Color.fromARGB(255, 191, 154, 94)),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Handcrafted With ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text('Love',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        SizedBox(height: 16.0),
                        Text(
                          'our decarators and bakers only the finest, ',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'ingredients to craft each item with care',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'creations made just for you',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                              },
                              child: Text(
                                'skip',
                                style: TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Ob3(),
                                  ));
                                },
                                icon: Icon(Icons.arrow_forward)),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
