import 'package:bekart/buynow.dart';
import 'package:flutter/material.dart';

class Customcart extends StatelessWidget {
  const Customcart(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.productDetails,
      required this.productImg,
      required this.pageName});
  final String productName;
  final String productPrice;
  final String productDetails;
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
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(productImg), fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Text(
            productPrice,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(productDetails),
          Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Spacer(),
              Icon(Icons.delete)
            ],
          )
        ]),
      ),
    );
  }
}
