import 'package:bekart/sshop/adddeliveryboys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Viewdeliveryagents extends StatefulWidget {
  const Viewdeliveryagents({super.key});

  @override
  State<Viewdeliveryagents> createState() => _ViewdeliveryagentsState();
}

class _ViewdeliveryagentsState extends State<Viewdeliveryagents> {
  List<Map<String, dynamic>> deliveryboys = [
    {
      "name": 'rahul',
      "shopname": "cakeland",
      "age": "27",
      "phone": "9961233859",
      "email": "rahul@gmail.com",
      "licence": "assets/licence2.png"
    },
    {
      "name": 'anadh',
      "shopname": "palnetcafe",
      "age": "24",
      "phone": "9961238745",
      "email": "anandh@gmail.com",
      "licence": "assets/licence2.png"
    },
    {
      "name": 'raju',
      "shopname": "bakeo clock",
      "age": "29",
      "phone": "987653859",
      "email": "raju@gmail.com",
      "licence": "assets/licence2.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'view delivery boys',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 250,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Text(
                            deliveryboys[index]['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            deliveryboys[index]['shopname'],
                          ),
                          Text(
                            deliveryboys[index]['age'],
                          ),
                          Text(deliveryboys[index]['phone']),
                          Text(deliveryboys[index]['email']),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        deliveryboys[index]['licence']))),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {}, icon: Icon(Icons.edit)),
                              Spacer(),
                              Icon(Icons.delete),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10,
                      ),
                  itemCount: deliveryboys.length),
            ),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 30,
              width: 120,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Deliveryboysadd(),
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