import 'package:bekart/customs/customorder.dart';
import 'package:flutter/material.dart';

class Orderss extends StatefulWidget {
  const Orderss({super.key});

  @override
  State<Orderss> createState() => _OrderssState();
}

class _OrderssState extends State<Orderss> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/cookie.jpeg',
      "delivered": "deliverd for 6th august",
      "details": "Cookie with choclate",
    },
    {
      "img": 'assets/donetblack.jpeg',
      "delivered": "order shipped",
      "details": "choclate donet",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 154, 94),
          title: Text('my orders'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: Colors.black),
                filled: true,
                fillColor: const Color.fromARGB(255, 255, 255, 255),
                hintText: 'search your orders',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Customorder(
                          productImg: products[index]['img'],
                          deliverd: products[index]['delivered'],
                          productDetails: products[index]['details']);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: products.length),
              )
            ],
          ),
        ));
  }
}
