import 'package:bekart/addtocart.dart';
import 'package:bekart/customs/customcard.dart';
import 'package:bekart/events.dart';
import 'package:bekart/favouirt.dart';
import 'package:bekart/home.dart';
import 'package:bekart/productdetals.dart';
import 'package:bekart/rateus.dart';
import 'package:flutter/material.dart';

class Planetcafe extends StatefulWidget {
  const Planetcafe({super.key});

  @override
  State<Planetcafe> createState() => _PlanetcafeState();
}

class _PlanetcafeState extends State<Planetcafe> {
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
    Productdetals(),
    Text(''),
    Text(''),
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CAKE LAND',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Text(
                    'Perinthalamanna locality',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Spacer(),
                  Text('4'),
                  Icon(Icons.star)
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.4,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Customcard(
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
            Container(
              height: 30,
              width: 100,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Rating(),
                    ));
                  },
                  child: Text('rate us'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.black,
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
