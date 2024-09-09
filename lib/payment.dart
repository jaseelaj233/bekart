import 'package:bekart/buynow.dart';
import 'package:bekart/ooo.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          'cash on delivery',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Image(
            height: 100,
            width: 100,
            image: AssetImage(
                'assets/WhatsApp Image 2024-07-01 at 9.26.12 PM.jpeg')),
        SizedBox(
          height: 20,
        ),
        Image(
            height: 100,
            width: 100,
            image: AssetImage('assets/download (1).png')),
        Image(
            height: 100,
            width: 100,
            image: AssetImage('assets/download (2).png')),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 150,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Obj(),
                    ));
                  },
                  child: Text('proceed to pay'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.black,
                    ),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                  )),
            ),
          ],
        ),
      ]),
    ));
  }
}
