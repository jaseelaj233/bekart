import 'package:bekart/deliveryboys/pickuporder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deliveryhome extends StatefulWidget {
  const Deliveryhome({super.key});

  @override
  State<Deliveryhome> createState() => _DeliveryhomeState();
}

class _DeliveryhomeState extends State<Deliveryhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deliveryboy HOME',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 250,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Pickuporder(),
                      ));
                    },
                    child: Text('View assign work'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 191, 154, 94),
                      ),
                      foregroundColor: WidgetStatePropertyAll(Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
