import 'package:bekart/customs/customevents.dart';
import 'package:bekart/home.dart';
import 'package:bekart/sshop/addpage.dart';
import 'package:bekart/viewexam.dart';
import 'package:flutter/material.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/WhatsApp Image 2024-08-28 at 2.16.53 PM.jpeg',
      "decor": "Birthday celebration",
      "shop": "planetcafe decor",
    },
    {
      "img": 'assets/WhatsApp Image 2024-09-01 at 9.03.47 PM (1).jpeg',
      "decor": "anniversary  celebration",
      "shop": "dream day",
    },
    {
      "img": 'assets/WhatsApp Image 2024-09-01 at 11.28.26 PM.jpeg',
      "decor": "brid to be",
      "shop": "cake land decor",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Celebrate your special days',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  'The most beautiful things are note assosiated with money they are memories and moments....'),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.6,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Customevents(
                        decorName: products[index]['decor'],
                        decorEvens: products[index]['shop'],
                        productimg: products[index]['img'],
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                    itemCount: products.length),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DataProductFirebase(),
                        ));
                      },
                      icon: Icon(Icons.remove_red_eye)),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Addpage(),
                        ));
                      },
                      icon: Icon(Icons.upload)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
