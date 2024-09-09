import 'package:bekart/admin/viewapprating.dart';
import 'package:bekart/admin/viewdeliveryboys.dart';
import 'package:bekart/admin/viewevents.dart';
import 'package:bekart/admin/viewshopproducts.dart';
import 'package:bekart/admin/viewshopratings.dart';
import 'package:bekart/admin/viewshopregister.dart';
import 'package:bekart/customs/adminhomebutton.dart';
import 'package:flutter/material.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  List<String> buttons = [
    'view registered shops',
    'view shop products',
    'view delivery boys',
    'view events',
    'view shop rating',
    'view app rating'
  ];
  List<Widget> routes = [
    Viewshopregister(),
    Viewshopproducts(),
    Viewdeliveryboys(),
    Viewevents(),
    Viewshopratings(),
    Viewapprating()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ADMIN HOME',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Adminhomebutton(
                  buttonText: buttons[index], pageName: routes[index]);
            },
            separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
            itemCount: buttons.length),
      ),
    );
  }
}
