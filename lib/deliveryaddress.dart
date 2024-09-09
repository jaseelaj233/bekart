import 'package:bekart/buynow.dart';
import 'package:bekart/productdetals.dart';
import 'package:flutter/material.dart';

class Deliveryaddress extends StatefulWidget {
  const Deliveryaddress({super.key});

  @override
  State<Deliveryaddress> createState() => _DeliveryaddressState();
}

class _DeliveryaddressState extends State<Deliveryaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text('delivery address'),
      ),
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(255, 255, 255, 1),
                hintText: 'phonenumber',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'landmark',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 50,
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
                      child: Text('submit'),
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Colors.black,
                        ),
                        foregroundColor: WidgetStatePropertyAll(Colors.white),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
