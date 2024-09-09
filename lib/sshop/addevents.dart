import 'package:bekart/events.dart';
import 'package:bekart/sshop/editevents.dart';
import 'package:bekart/sshop/eventspage.dart';
import 'package:flutter/material.dart';

class Addevents extends StatefulWidget {
  const Addevents({super.key});

  @override
  State<Addevents> createState() => _AddeventsState();
}

class _AddeventsState extends State<Addevents> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/WhatsApp Image 2024-08-28 at 2.16.53 PM.jpeg',
      "decor": "Birthday celebration",
      "shop": "cakeland",
    },
    {
      "img": 'assets/WhatsApp Image 2024-09-01 at 9.03.47 PM (1).jpeg',
      "decor": "anniversary  celebration",
      "shop": "cakeland",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'Add  Events',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              products[index]['img']),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            products[index]['shop'],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Editevents(),
                                    ));
                                  },
                                  icon: Icon(Icons.edit)),
                              SizedBox(
                                width: 150,
                              ),
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.delete)),
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
            SizedBox(
              height: 40,
            ),
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Eventspage(),
                    ));
                  },
                  child: Text('add new'),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 191, 31, 31),
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
