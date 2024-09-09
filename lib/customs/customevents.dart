import 'package:flutter/material.dart';

class Customevents extends StatelessWidget {
  const Customevents({
    super.key,
    required this.decorName,
    required this.decorEvens,
    required this.productimg,
  });
  final String decorName;
  final String decorEvens;
  final String productimg;

  @override
  Widget build(BuildContext context) {
    return (Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  decorName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(productimg), fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
          Text(
            decorEvens,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
            ],
          )
        ],
      ),
    ));
  }
}
