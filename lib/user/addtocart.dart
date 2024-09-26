import 'package:bekart/buynow.dart';
import 'package:bekart/customs/customcart.dart';
import 'package:bekart/home.dart';
import 'package:flutter/material.dart';

class Addtocart extends StatefulWidget {
  const Addtocart({super.key});

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/cookie.jpeg',
      "price": "200",
      "name": "Cookies",
      "details": "Cookie with choclate",
    },
    {
      "img": 'assets/cacke.jpeg',
      "price": "300",
      "name": "cake",
      "details": "yummy cake",
    },
    {
      "img": 'assets/donetblack.jpeg',
      "price": "500",
      "name": "donet",
      "details": "choclate donet",
    },
    {
      "img": 'assets/pexels-geraud-pfeiffer-6606003.jpg',
      "price": "800",
      "name": " white forest",
      "details": "white forest",
    }
  ];
  List<Widget> routes = [
    Text(''),
    Text(''),
    Text(''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text('cart'),
      ),
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Customcart(
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
