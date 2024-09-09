import 'package:flutter/material.dart';

class Viewapprating extends StatefulWidget {
  const Viewapprating({super.key});

  @override
  State<Viewapprating> createState() => _ViewshopratingState();
}

class _ViewshopratingState extends State<Viewapprating> {
  List<Map<String, dynamic>> products = [
    {
      "rating": "4 rating",
      "feedback": "very nice app",
    },
    {
      "rating": "5 rating",
      "feedback": "usefull app",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'view app rating',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 800,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Text(products[index]['rating']),
                      Text(products[index]['feedback'])
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: products.length),
        ),
      ),
    ));
  }
}
