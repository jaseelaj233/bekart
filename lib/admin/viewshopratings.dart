import 'package:flutter/material.dart';

class Viewshopratings extends StatefulWidget {
  const Viewshopratings({super.key});

  @override
  State<Viewshopratings> createState() => _ViewshopratingsState();
}

class _ViewshopratingsState extends State<Viewshopratings> {
  List<Map<String, dynamic>> products = [
    {
      "shopname": 'cake land',
      "rating": "4 rating",
      "feedback": "very nice shop",
    },
    {
      "shopname": 'planetcafe',
      "rating": "3.5 rating",
      "feedback": "very good foods",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'view shops rating',
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
                      Text(
                        products[index]['shopname'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
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
    );
  }
}
