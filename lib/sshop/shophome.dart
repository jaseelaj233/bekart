import 'package:bekart/customs/shophomebutton.dart';
import 'package:bekart/sshop/adddeliveryboys.dart';
import 'package:bekart/sshop/addevents.dart';
import 'package:bekart/sshop/addproduct.dart';
import 'package:bekart/sshop/assignwork.dart';
import 'package:bekart/sshop/viewdeliveryagent.dart';
import 'package:bekart/sshop/viewshoppratings.dart';
import 'package:flutter/material.dart';

class Shophome extends StatefulWidget {
  const Shophome({super.key});

  @override
  State<Shophome> createState() => _ShophomeState();
}

class _ShophomeState extends State<Shophome> {
  List<String> buttons = [
    'Add shop products',
    'add delivery boys',
    'view orders',
    'Add events',
    'view shop rating',
  ];
  List<Widget> routes = [
    Addproduct(),
    Viewdeliveryagents(),
    Assignwork(),
    Addevents(),
    Viewshopppsratings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SHOP HOME',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Shophomebutton(
                    buttonText: buttons[index], pageName: routes[index]);
              },
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              itemCount: buttons.length),
        ),
      ),
    );
  }
}
