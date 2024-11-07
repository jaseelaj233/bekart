import 'package:bekart/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'productPreview/BackoBack.dart';
import 'productPreview/CakeLand.dart';
import 'productPreview/KrBakers.dart';
import 'productPreview/NikkaBakers.dart';
import 'productPreview/planetcafe.dart';

class homepage2 extends StatefulWidget {
  const homepage2({super.key});

  @override
  State<homepage2> createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> {
  Widget _shpecard(String title, String imagePath, Widget destinationPage) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => destinationPage));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 300,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                color: Colors.brown[200],
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    " 4",
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.star, color: Colors.amber),
                ],
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Bekart',
              style: const TextStyle(
                fontSize: 24,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
            )
          ],
        ),
        actions: [
          const Text(
            'Order your favourite sweets.',
            style: TextStyle(fontSize: 16),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 191, 154, 94),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _shpecard(
                "Planet Cafe",
                "assets/WhatsApp Image 2024-10-01 at 10.15.57 PM.jpeg",
                viewplanetcafe(),
              ),
              _shpecard(
                  "Nila Bakers",
                  "assets/WhatsApp Image 2024-10-01 at 10.15.04 PM.jpeg",
                  nikkaBakers()),
              _shpecard(
                  "KR Bakers",
                  "assets/WhatsApp Image 2024-10-01 at 10.15.16 PM.jpeg",
                  kRBakersview()),
              _shpecard(
                  "Cake Land",
                  "assets/WhatsApp Image 2024-10-01 at 10.15.45 PM.jpeg",
                  cakeLandView()),
              _shpecard(
                  "Back 0 Back ",
                  "assets/WhatsApp Image 2024-10-01 at 10.15.34 PM.jpeg",
                  BackBackView()),
            ],
          ),
        ),
      ),
    );
  }
}
