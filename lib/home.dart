// import 'package:bekart/addtocart.dart';

// import 'package:bekart/customs/customhome.dart';
// import 'package:bekart/events.dart';
// import 'package:bekart/favouirt.dart';

// import 'package:bekart/finalpages/homefinal1.dart';
// import 'package:bekart/j.dart';
// import 'package:bekart/productdetals.dart';
// import 'package:bekart/shop.dart';
// import 'package:bekart/userhomedetails.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '1_cafeView/cartProviderModel/producCartUsingProvider.dart';
// import '1_cafeView/homepageinal2.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   int selecteditem = 0;
//   List<Widget> bottomnav = [
//     homepage2(),
//     CartScreenProvider(),
//     Events(),
//     Jprofile(),
//   ];
//   void onitemtapped(int index) {
//     setState(() {
//       selecteditem = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 191, 154, 94),
//       body: Padding(
//         padding: EdgeInsets.all(8.0),
//         child: Container(child: bottomnav.elementAt(selecteditem)),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.black,
//         items: [
//           const BottomNavigationBarItem(
//             tooltip: 'home',
//             label: '',
//             icon: Icon(Icons.home),
//           ),
//           const BottomNavigationBarItem(
//             tooltip: 'cart',
//             label: '',
//             icon: Icon(Icons.shopping_cart),
//           ),
//           const BottomNavigationBarItem(
//               tooltip: 'events', label: '', icon: Icon(Icons.event_seat)),
//           const BottomNavigationBarItem(
//               tooltip: 'accounds', label: '', icon: Icon(Icons.person))
//         ],
//         onTap: onitemtapped,
//         currentIndex: selecteditem,
//         selectedItemColor: Colors.amber,
//         unselectedItemColor: Colors.white,
//         showSelectedLabels: false,
//       ),
//     );
//   }
// }
import 'package:bekart/events.dart';
import 'package:bekart/j.dart';
import 'package:flutter/material.dart';

import '1_cafeView/cartProviderModel/producCartUsingProvider.dart';
import '1_cafeView/homepageinal2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0; // Renamed for clarity

  // List of screens for bottom navigation
  List<Widget> pages = [
    homepage2(),
    CartScreenProvider(),
    Events(),
    Jprofile(),
  ];

  // Method to handle bottom navigation item tap
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 191, 154, 94),
      body: pages[selectedIndex], // Removed unnecessary Container and Padding
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            tooltip: 'Home',
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            tooltip: 'Cart',
            label: '',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            tooltip: 'Events',
            label: '',
            icon: Icon(Icons.event_seat),
          ),
          BottomNavigationBarItem(
            tooltip: 'Profile',
            label: '',
            icon: Icon(Icons.person),
          ),
        ],
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
      ),
    );
  }
}
