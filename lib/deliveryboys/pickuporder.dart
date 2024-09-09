import 'package:bekart/deliveryboys/status.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pickuporder extends StatefulWidget {
  const Pickuporder({super.key});

  @override
  State<Pickuporder> createState() => _PickuporderState();
}

class _PickuporderState extends State<Pickuporder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 191, 154, 94),
          title: Text(
            'pick up order',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              height: 200,
              width: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Cookies',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage('assets/cookie.jpeg'))),
                      ),
                    ],
                  ),
                  Text(
                    '200',
                  ),
                  Container(
                    height: 50,
                    width: 150,
                    child: TextButton(
                        onPressed: () {
                          // if (formkey.currentState!.validate()) ;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Status(),
                          ));
                        },
                        child: Text('pickup order'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            Colors.black,
                          ),
                          foregroundColor: WidgetStatePropertyAll(Colors.white),
                        )),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
