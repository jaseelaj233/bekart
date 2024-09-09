import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pickupdelivery extends StatefulWidget {
  const Pickupdelivery({super.key});

  @override
  State<Pickupdelivery> createState() => _PickupdeliveryState();
}

class _PickupdeliveryState extends State<Pickupdelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 191, 154, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 191, 154, 94),
        title: Text(
          'delivery address',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: 450,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Text(' jassela,karimbanakkal house,elad po,679340,7560981322'),
                Container(
                  height: 50,
                  width: 150,
                  child: TextButton(
                      onPressed: () {
                        // if (formkey.currentState!.validate()) ;
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => Addevents(),
                        // ));
                      },
                      child: Text('ok'),
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
        ],
      ),
    );
  }
}
