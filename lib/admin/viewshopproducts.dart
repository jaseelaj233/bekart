import 'package:flutter/material.dart';

class Viewshopproducts extends StatefulWidget {
  const Viewshopproducts({super.key});

  @override
  State<Viewshopproducts> createState() => _ViewshopproductsState();
}

class _ViewshopproductsState extends State<Viewshopproducts> {
  List<Map<String, dynamic>> shopproducts = [
    {
      "name": "Cookies",
      "img": 'assets/cookie.jpeg',
      "price": "200",
      "details": "Cookie with choclate",
      "shopname": "cake land"
    },
    {
      "name": "donet",
      "img": 'assets/donetrose.jpeg',
      "price": "200",
      "details": "Cookie with choclate",
      "shopname": "planetcafe"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'view shops product',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            shopproducts[index]['shopname'],
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
                                    image:
                                        AssetImage(shopproducts[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      shopproducts[index]['name'],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(shopproducts[index]['price']),
                    Text(shopproducts[index]['details']),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delete),
                      ],
                    )
                  ]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: shopproducts.length),
        ));
  }
}
