import 'package:bekart/customs/custombutton.dart';
import 'package:bekart/home.dart';
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
  List<String> buttons = ['your profile', 'your orders', 'Log out'];
  List<Widget> routes = [
    Yourprofile(),
    Orderss(),
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PROFILE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
          )),
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
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DataProductFirebase(),
                    ));
                  },
                  icon: Icon(Icons.remove_red_eye)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Addproduct(),
                    ));
                  },
                  icon: Icon(Icons.upload)),
            ],
          )
        ]),
      ),
    );
  }
}
