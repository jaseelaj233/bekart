import 'package:bekart/customs/customhome.dart';
import 'package:bekart/productdetals.dart';
import 'package:flutter/material.dart';

class Machhome extends StatefulWidget {
  const Machhome({super.key});

  @override
  State<Machhome> createState() => _MachhomeState();
}

class _MachhomeState extends State<Machhome> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/cookie.jpeg',
      "name": "Cookies",
    },
    {
      "img": 'assets/donetrose.jpeg',
      "name": "macrons",
    },
  ];
  List<Widget> routes = [
    Productdetals(),
    Text(''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'home',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Customhome(
                        productName: products[index]['name'],
                        productImg: products[index]['img'],
                        pageName: routes[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                  itemCount: products.length),
            ),
          ],
        ),
      ),
    );
  }
}
