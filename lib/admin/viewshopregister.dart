import 'package:bekart/customs/customviewregister.dart';
import 'package:flutter/material.dart';

class Viewshopregister extends StatefulWidget {
  const Viewshopregister({super.key});

  @override
  State<Viewshopregister> createState() => _ViewuserregisterState();
}

class _ViewuserregisterState extends State<Viewshopregister> {
  List<Map<String, dynamic>> products = [
    {
      "shopname": 'planetcafe',
      "ownername": "yasmin azez",
      "details": "perinthalmanna locality,near mouana hospital,sm complex",
      "phone": "9961233859",
      "email": "yasmin@gmail.com",
      "licence": "assets/licence2.png"
    },
    {
      "shopname": 'cake land',
      "ownername": "rahul",
      "details": "perinthalmanna locality,near alshifa hospital, manazicomplex",
      "phone": "9961233884",
      "email": "rahul@gmail.com",
      "licence": "assets/licence2.png",
    },
    {
      "shopname": 'bake o clock',
      "ownername": "shameel",
      "details": "angadipuram locality,near qater tower",
      "phone": "7560981322",
      "email": "rahul@gmail.com",
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
          'registerd users',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Customviewregister(
                    shopName: products[index]['shopname'],
                    ownerName: products[index]['ownername'],
                    details: products[index]['details'],
                    mobileNum: products[index]['phone'],
                    email: products[index]['email'],
                    licenceimg: products[index]['licence']);
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: products.length)),
    );
  }
}
