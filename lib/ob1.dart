import 'package:bekart/login.dart';
import 'package:bekart/ob2.dart';
import 'package:flutter/material.dart';

class Ob1 extends StatefulWidget {
  const Ob1({super.key});

  @override
  State<Ob1> createState() => _Ob1State();
}

class _Ob1State extends State<Ob1> {
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
                "assets/cupcake.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 250, 200)),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          'Discover the ',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text('Delight',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        SizedBox(height: 16.0),
                        Text(
                          'Explore a world of freshly baked goods, ',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'from classic favourite to unique ',
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
                                    builder: (context) => Ob2(),
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
