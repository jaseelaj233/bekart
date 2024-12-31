import 'package:flutter/material.dart';

class Customhome extends StatelessWidget {
  const Customhome({
    super.key,
    required this.productName,
    required this.productImg,
    required this.pageName,
  });
  final String productName;

  final String productImg;

  final Widget pageName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => pageName,
        ));
      },
      child: Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(productImg), fit: BoxFit.cover)),
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
