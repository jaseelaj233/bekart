import 'package:bekart/customs/custombutton.dart';
import 'package:bekart/home.dart';
import 'package:bekart/orderss.dart';
import 'package:bekart/profile.dart';
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
          Text('would you like to this play store'),
          Text('your feedback help us make your experiejce better'),
          SizedBox(),
          SizedBox(
            height: 30,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return IconButton(
                      onPressed: () {}, icon: Icon(Icons.star_border_outlined));
                },
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 5),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromARGB(255, 144, 142, 139),
              hintText: 'write somthing......',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 150,
            child: TextButton(
                onPressed: () {},
                child: Text('Add feedback'),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.black,
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                )),
          ),
        ]),
      ),
    );
  }
}
