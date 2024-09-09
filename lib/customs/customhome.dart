import 'package:flutter/material.dart';

class Customhome extends StatelessWidget {
  const Customhome({
    super.key,
    required this.productName,
    required this.shopName,
    required this.productImg,
    required this.pageName,
    required this.starValue,
  });
  final String productName;
  final String shopName;

  final String productImg;

  final Widget pageName;
  final String starValue;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => pageName,
        ));
      },
      child: Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 450,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(productImg), fit: BoxFit.cover)),
              ),
              Row(
                children: [
                  Text(
                    shopName,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Spacer(),
                  Text(
                    starValue,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.star),
                ],
              ),
              Text(
                productName,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
