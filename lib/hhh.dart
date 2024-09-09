import 'package:flutter/material.dart';

class OOO extends StatefulWidget {
  const OOO({super.key});

  @override
  State<OOO> createState() => _OOOState();
}

class _OOOState extends State<OOO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(''), fit: BoxFit.cover)),
            ),
            Row(
              children: [
                Text(
                  'YYYY',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Spacer(),
                Text(
                  '4',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.star),
              ],
            ),
            Text(
              'CHO',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
