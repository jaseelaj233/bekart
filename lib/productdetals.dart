import 'package:bekart/addtocart.dart';
import 'package:bekart/buynow.dart';
import 'package:bekart/deliveryaddress.dart';
import 'package:bekart/shop.dart';
import 'package:flutter/material.dart';

class Productdetals extends StatefulWidget {
  const Productdetals({super.key});

  @override
  State<Productdetals> createState() => _ProductdetalsState();
}

class _ProductdetalsState extends State<Productdetals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text('your product'),
      ),
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage('assets/cookie.jpeg'),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Cookies',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text('200')),
            SizedBox(
              height: 40,
            ),
            Text(
                'choclate cookies asweet desert made from flour layers of texture a slightly crispur shell hate holds up to '),
            SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Buynow(),
                        ));
                      },
                      child: Text('Buy now'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.black,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      )),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Addtocart(),
                        ));
                      },
                      child: Text('Addto cart'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.black,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
