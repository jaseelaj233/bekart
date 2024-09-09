import 'package:bekart/customs/customfavourite.dart';
import 'package:bekart/productdetals.dart';
import 'package:bekart/shop.dart';
import 'package:flutter/material.dart';

class Favouirt extends StatefulWidget {
  const Favouirt({super.key});

  @override
  State<Favouirt> createState() => _FavouirtState();
}

class _FavouirtState extends State<Favouirt> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/cookie.jpeg',
      "price": "200",
      "name": "Cookies",
      "details": "Cookie with choclate",
    },
    {
      "img": 'assets/donetrose.jpeg',
      "price": "300",
      "name": "macrons",
      "details": "sandwich cookie made with almond flavour",
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
          'Wish list',
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
                    return Customfavourite(
                        productName: products[index]['name'],
                        productPrice: products[index]['price'],
                        productDetails: products[index]['details'],
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
