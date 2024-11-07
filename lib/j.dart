import 'package:bekart/1_cafeView/cartProviderModel/producCartUsingProvider.dart';
import 'package:bekart/addtocart.dart';
import 'package:bekart/customs/custombutton.dart';
import 'package:bekart/events.dart';
import 'package:bekart/home.dart';
import 'package:bekart/logout.dart';
import 'package:bekart/orderss.dart';
import 'package:bekart/profile.dart';
import 'package:bekart/sshop/addpage.dart';
import 'package:bekart/sshop/addproduct.dart';
import 'package:bekart/viewexam.dart';
import 'package:flutter/material.dart';

class Jprofile extends StatefulWidget {
  const Jprofile({super.key});

  @override
  State<Jprofile> createState() => _JprofileState();
}

class _JprofileState extends State<Jprofile> {
  List<String> buttons = ['add to cart', 'events', 'logout'];
  List<Widget> routes = [CartScreenProvider(), Events(), LogoutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.black,
                child: Text(
                  'J',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          Center(
            child: Text(
              'Jaseela',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Custombutton(
                    buttonText: buttons[index],
                    pageName: routes[index],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 20,
                    ),
                itemCount: 3),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
