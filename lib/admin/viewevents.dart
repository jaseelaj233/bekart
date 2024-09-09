import 'package:flutter/material.dart';

class Viewevents extends StatefulWidget {
  const Viewevents({super.key});

  @override
  State<Viewevents> createState() => _VieweventsState();
}

class _VieweventsState extends State<Viewevents> {
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
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'view Events',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            products[index]['decor'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(products[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      products[index]['shop'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            itemCount: products.length),
      ),
    );
  }
}
