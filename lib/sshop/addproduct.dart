import 'package:bekart/sshop/addpage.dart';
import 'package:bekart/sshop/edit.dart';
import 'package:flutter/material.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  List<Map<String, dynamic>> shopproducts = [
    {
      "name": "Cookies",
      "img": 'assets/cookie.jpeg',
      "price": "200",
      "details": "Cookie with choclate",
    },
    {
      "name": "donet",
      "img": 'assets/donetrose.jpeg',
      "price": "200",
      "details": "Cookie with choclate",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'add product',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
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
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          shopproducts[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        shopproducts[index]['name'],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(shopproducts[index]['price']),
                      Text(shopproducts[index]['details']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 30,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Edit(),
                                  ));
                                },
                                child: Text('edit'),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.black,
                                  ),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                )),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => Addtocart(),
                                  // ));
                                },
                                child: Text('delete'),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                    Colors.black,
                                  ),
                                  foregroundColor:
                                      WidgetStatePropertyAll(Colors.white),
                                )),
                          ),
                        ],
                      )
                    ]),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: shopproducts.length),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 30,
            width: 120,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Addpage(),
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
    );
  }
}
