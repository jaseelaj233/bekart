import 'package:bekart/addtocart.dart';
import 'package:bekart/events.dart';
import 'package:bekart/favouirt.dart';
import 'package:bekart/home.dart';
import 'package:flutter/material.dart';

class Bottomhome extends StatefulWidget {
  const Bottomhome({super.key});

  @override
  State<Bottomhome> createState() => _BottomhomeState();
}

class _BottomhomeState extends State<Bottomhome> {
  List<IconData> icons = [
    Icons.home,
    Icons.favorite_outline,
    Icons.shopping_cart,
    Icons.event,
  ];
  List<Widget> routes = [
    Home(),
    Favouirt(),
    Addtocart(),
    Events(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routes[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  icon: Icon(icons[index])),
            );
          },
        ),
      ),
    );
  }
}
