import 'package:flutter/material.dart';

class Customorder extends StatelessWidget {
  const Customorder(
      {super.key,
      required this.productImg,
      required this.deliverd,
      required this.productDetails});
  final String productImg;
  final String deliverd;
  final String productDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 255, 255, 255)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: AssetImage(productImg), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [Text(deliverd), Text(productDetails)],
              )
            ],
          )
        ],
      ),
    );
  }
}
