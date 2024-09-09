import 'package:bekart/customs/customhome.dart';
import 'package:bekart/j.dart';
import 'package:bekart/shop.dart';
import 'package:flutter/material.dart';

class Userhomedetails extends StatefulWidget {
  const Userhomedetails({super.key});

  @override
  State<Userhomedetails> createState() => _UserhomedetailsState();
}

class _UserhomedetailsState extends State<Userhomedetails> {
  List<Map<String, dynamic>> products = [
    {
      "img": 'assets/cookie.jpeg',
      "name": "CAKE LAND",
      "star": "4",
      "details": "spcial:CHOKO TRUFFLE",
    },
    {
      "img": 'assets/cacke.jpeg',
      "name": "BACK O CLOCK",
      "star": "3.9",
      "details": "spcial:DONET",
    },
    {
      "img": 'assets/donetrose.jpeg',
      "name": "PLANET CAFE",
      "star": "4",
      "details": "spcial:COOKIES",
    },
    {
      "img": "assets/donetblack.jpeg",
      "name": "TERMINAL 20",
      "star": "4.5",
      "details": "spcial:DONET",
    },
  ];
  List<Widget> routes = [
    Planetcafe(),
    Text(''),
    Text(''),
    Text(''),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 154, 94),
        ),
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Bekart',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Jprofile(),
                      ));
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Text('J'),
                    ),
                  )
                ],
              ),
              Text(
                'order your Favouirite Sweets.........',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.black),
                  SizedBox(width: 8),
                  Text(
                    'Angadipuram',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  suffixIcon: Icon(Icons.mic, color: Colors.black),
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'search items',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.8,
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Customhome(
                          productName: products[index]['details'],
                          shopName: products[index]['name'],
                          productImg: products[index]['img'],
                          pageName: routes[index],
                          starValue: products[index]['star']);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: products.length),
              ),
            ])));
  }
}
